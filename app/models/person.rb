class Person < ApplicationRecord
  include PgSearch
  has_many :phones
  validates :name, presence: true

  scope :ordered_people, -> {all.order(name: :asc)}
  pg_search_scope :search,
                  :against => [:name],
                  :using => {tsearch: {:dictionary => "portuguese", :prefix => true}},
                  :ignoring => :accents

  multisearchable :against => [:name]

  searchkick word_start: [:name], language: "brazilian"
end
