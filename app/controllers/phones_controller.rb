class PhonesController < ApplicationController

  skip_before_action :authorize, only: [:search]

  def search
    @term = params[:term]
    if params[:term].blank?
      return @phones = Phone.includes(:person).all.order('people.name asc')
    else
      return @phones = Phone.search(params[:term])
    end
  end

  def new
    @phone = Phone.new
    @phone.build_person
    @phone.build_division
    @phone.division.build_parent_division
    @phone.division.parent_division.build_parent_division
  end

  def create
    @phone = Phone.new(phone_params)
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

  private

  def phone_params
    params.require(:phone).permit(:ddr, :ramal, person_attributes: [:id, :name],
                                  division_attributes: [:id, :name,
                                             parent_division_attributes: [:id, :name,
                                                               parent_division_attributes: [:id, :name]]])
  end
end
