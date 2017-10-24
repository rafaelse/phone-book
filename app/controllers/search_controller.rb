class SearchController < ApplicationController
  skip_before_action :authorize
  layout 'application', only: [:search]

  def index
  end

  def search
    @term = params[:term]
    @results = {items: [], first_item_type: '', item_types_count: {}}
    unless params[:term].blank?
      # @phones = Phone.search(params[:term])
      results = Searchkick.search params[:term],
                                  index_name: [Phone, Person, Division],
                                  indices_boost: {Phone => 1, Division => 2, Person => 3},
                                  operator: "or",
                                  misspellings: {below: 3, edit_distance: 5},
                                  body_options: {min_score: 2},
                                  fields: [{name: :word_start}, :ddr, :branch]

      @active_class = results.results.empty? ? nil : results.results.first.class
      results.results.each do |result|
        @phones << result if result.class == Phone
        @people << result if result.class == Person
        @divisions << result if result.class == Division
      end
    end
  end
end
