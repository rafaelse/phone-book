class PeopleController < ApplicationController

  skip_before_action :authorize

  def search
    @people = Person.search(params[:term])
  end
end
