class PeopleController < ApplicationController

  skip_before_action :authorize

  def search
    @people = Person.search(params[:term])
  end

  def phones
    @phones = Person.find(params[:id]).phones
    render 'phones/index'
  end
end
