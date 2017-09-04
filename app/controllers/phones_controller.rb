class PhonesController < ApplicationController
  def search
    if params[:term].nil?
      @phones = Phone.all
    else
      @phones = Phone.search(params[:term])
    end
  end
end
