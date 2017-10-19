class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :destroy, :delete, :edit, :update]
  before_action :load_phones, only: [:search]
  skip_before_action :authorize, only: [:search, :show]

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
        format.html {redirect_to new_phone_url, notice: (t 'controller.phone.create.ok')}
      else
        format.html {render :new}
      end
    end
  end

  def delete
    @phone = Phone.find(params[:phone_id])
  end

  def destroy
    @phone.destroy
    respond_to do |format|
      format.js {flash.now[:notice] = (t 'controller.phone.delete.ok')}
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html {redirect_to edit_phone_path(@phone), notice: (t 'controller.phone.update.ok')}
        format.json {render :index, status: :ok, location: @phone}
      else
        format.html {render :edit}
        format.json {render json: @phone.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def phone_params
    params.require(:phone).permit(:ddr, :branch, person_attributes: [:id, :name],
                                  division_attributes: [:id, :name,
                                                        parent_division_attributes: [:id, :name,
                                                                                     parent_division_attributes: [:id, :name]]])
  end

  def set_phone
    @phone = Phone.find(params[:id]) if params[:id].present?
    @phone = Phone.find(params[:phone_id]) if params[:phone_id].present?
  end

  def load_phones
    @phones = Phone.includes(:person).all.order('people.name asc')
  end
end
