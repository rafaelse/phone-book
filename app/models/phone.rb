class Phone < ApplicationRecord
  include PgSearch
  belongs_to :person
  belongs_to :division

  pg_search_scope :search, :against => [:ddr, :ramal],
                  :associated_against => {division: [:name, :ancestors],
                                          person: [:name]},
                  :using => {tsearch: {:dictionary => "portuguese"}},
                  :ignoring => :accents
end
