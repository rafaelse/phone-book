class SearchController < ApplicationController
  skip_before_action :authorize
  layout 'application', only: [:search]

  def index
  end

  def search
    @term = params[:term]
    @documents = []
    unless params[:term].blank?
      # @phones = Phone.search(params[:term])
      @documents = PgSearch.multisearch(params[:term])
    end
  end
end
