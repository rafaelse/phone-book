class PhonesController < ApplicationController

  def search
    if params[:term].blank?
      @phones = Phone.all
    else
      @phones = Phone.search(params[:term])
    end
  end

  def new
    @phone = Phone.new
    @secretarias = Division.secretarias
    @departamentos = @secretarias.first.subdivisions
    @setores = @departamentos.first.subdivisions
  end

  def create
    puts params[:telephone]
  end
end
