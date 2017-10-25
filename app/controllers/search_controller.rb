class SearchController < ApplicationController
  skip_before_action :authorize
  before_action :reset_results
  before_action :save_search, only: [:search]

  def index
  end

  def search
    @term = params[:term]
    unless params[:term].blank?
      results = Searchkick.search params[:term],
                                  index_name: [Phone, Person, Division],
                                  indices_boost: {Phone => 10, Division => 3, Person => 8},
                                  operator: "or",
                                  misspellings: {below: 3, edit_distance: 2},
                                  body_options: {min_score: 10},
                                  fields: [{:name => :word_start}, :ddr, :branch]

      @active_class = results.results.empty? ? nil : results.results.first.class
      results.results.each do |result|
        @phones << result if result.class == Phone
        @people << result if result.class == Person
        @divisions << result if result.class == Division
      end
    end
  end

  def people
    @person = Person.find(params[:id])
    if @person
      @active_class = Person
      @people << @person
    end
  end

  def divisions
    @division = Division.find(params[:id])
    if @division
      @active_class = Division
      @divisions << @division
    end
  end

  def subdivisions
    @division = Division.find(params[:id])
    if @division
      @active_class = Division
      @divisions = @division.subdivisions
    end
  end

  def phones
    @phone = Phone.find(params[:id])
    if @phone
      @active_class = Phone
      @phones << @phone
    end
  end

  private

  def reset_results
    @phones = []
    @people = []
    @divisions = []
  end

  def save_search
    session[:search] = params[:term]
  end
end
