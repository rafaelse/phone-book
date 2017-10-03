class SearchController < ApplicationController
  skip_before_action :authorize
  layout 'application', only: [:search]

  def index
  end

  def search
    @term = params[:term]
    @phones = []
    unless params[:term].blank?
      @phones = Phone.search(params[:term])
    end
    render 'phones/index'
  end
end
