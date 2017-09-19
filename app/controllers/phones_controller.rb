class PhonesController < ApplicationController

  skip_before_action :authorize, only: [:search]

  def search
    if params[:term].blank?
      @phones = Phone.includes(:person).all.order('people.name asc')
    else
      @phones = Phone.search(params[:term])
      #@phones = phones.to_a.sort {|p1, p2| p1.person.name <=> p2.person.name}
    end
  end

  def new
    @phone = Phone.new
    @secretaries = Division.secretaries
    @departments = Division.departments(@secretaries.first.id)
    @sectors = Division.sectors(@departments.first.id)
    @people = Person.ordered_people
  end

  def create
    @phones = Phone.all.order(created_at: :desc)
    @phone = construct_phone
    @phone.save
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
    @departments = Division.departments(params[:sec_id])
  end

  def update_sectors
    @sectors = Division.sectors(params[:dept_id])
  end

  private

  def tel_params
    params[:telephone]
  end

  def construct_phone
    sector = Division.find(tel_params[:sector_id])
    person = Person.find(tel_params[:person_id])
    Phone.new(ddr: tel_params[:ddr], ramal: tel_params[:ramal], division: sector, person: person)
  end
end
