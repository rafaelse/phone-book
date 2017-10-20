class PeopleController < ApplicationController

  before_action :set_person, only: [:phones]
  skip_before_action :authorize

  def search
    @people = Person.search params[:term], fields: [:name], match: :word_start
  end

  def phones
    @phones = @person.phones
  end

  private

  def set_person
    @person = Person.find params[:id]
  end
end
