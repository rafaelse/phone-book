class DivisionsController < ApplicationController

  skip_before_action :authorize

  def root_search
    @divisions = Division.root_search(params[:term])
  end

  def children_search
    @divisions = Division.children_search(params[:id], params[:term])
  end

  def subdivisions
    @divisions = Division.find(params[:id]).subdivisions
  end

  def phones
    @phones = Division.find(params[:id]).phones
    render 'phones/index'
  end
end
