class PhonesController < ApplicationController

  skip_before_action :authorize, only: [:search]

  def search
    if params[:term].blank?
      return @phones = Phone.includes(:person).all.order('people.name asc')
    else
      return @phones = Phone.search(params[:term])
    end
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = construct_phone
    respond_to do |format|
      if @phone.save
        format.html {redirect_to new_phone_url, notice: 'Telefone cadastrado com sucesso'}
      else
        format.html {render :new}
      end
    end
  end

  def delete
    @phone = Phone.find(params[:phone_id])
  end

  def destroy
    @phones = Phone.all.order(created_at: :desc)
    @phone = Phone.find(params[:id])
    @phone.destroy
  end

  def update_depts
    @departments = Division.children_divisions(params[:sec_id])
  end

  def update_sectors
    @sectors = Division.children_divisions(params[:dept_id])
  end

  private

  def tel_params
    params[:telephone]
  end

  def construct_phone
    phone = Phone.new(ddr: tel_params[:ddr], ramal: tel_params[:ramal])
    phone.person = !tel_params[:person_id].blank? ? Person.find(tel_params[:person_id]) : Person.new(name: tel_params[:person_name])
    phone.division = construct_division
    return phone
  end

  def construct_division
    sector = !tel_params[:sector_id].blank? ? Division.find(tel_params[:sector_id]) : Division.new(name: tel_params[:sector])
    dept = !tel_params[:dept_id].blank? ? Division.find(tel_params[:dept_id]) : Division.new(name: tel_params[:dept])
    office = !tel_params[:office_id].blank? ? Division.find(tel_params[:office_id]) : Division.new(name: tel_params[:office])
    dept.parent_division = office
    sector.parent_division = dept
    return sector
  end
end
