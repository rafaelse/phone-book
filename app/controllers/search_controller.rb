class SearchController < ApplicationController
  skip_before_action :authorize

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
                                   body_options: {min_score: 5},
                                   fields: [{name: :word_start}, :ddr, :branch]

      unless results.response["hits"]["total"] == 0
        first_item_type = results.response["hits"]["hits"].first["_type"]
        item_types = results.response["hits"]["hits"].collect {|item| item["_type"]}
        item_types_count = item_types.uniq.map {|type| [type, item_types.count(type)]}.to_h
        @results = {items: results.results, first_item_type: first_item_type, item_types_count: item_types_count}
      end
    end
  end
end
