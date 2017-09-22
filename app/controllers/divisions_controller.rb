class DivisionsController < ApplicationController

  skip_before_action :authorize

  def root_search
    @divisions = Division.root_search(params[:term])
  end

  def children_search
    @divisions = Division.children_search(params[:id], params[:term])
  end
end
