class Phone < ApplicationRecord
  include PgSearch
  belongs_to :person
  belongs_to :division

  pg_search_scope :search, :against => [:ddr, :ramal],
                  :associated_against => {division: [:name, :ancestors],
                                          person: [:name]},
                  :using => {tsearch: {:dictionary => "portuguese", :prefix => true, :any_word => true}},
                  :ignoring => :accents

  def office
    division.parent_division.parent_division
  end

  def department
    division.parent_division
  end

  def sector
    division
  end
end
