class DivisionsController < ApplicationController
  before_action :set_division, only: [:divisions, :phones]
  skip_before_action :authorize

  def root_search
    @divisions = Division.root_search(params[:term])
  end

  def children_search
    @divisions = Division.children_search(params[:id], params[:term])
  end

  def divisions
    if @division
      @divisions = @division.subdivisions and return
    else
      @divisions = Division.root_divisions and return
    end
  end

  def phones
    @phones = @division.phones
  end

  private

  def set_division
    @division = Division.find(params[:id])
  end
end
