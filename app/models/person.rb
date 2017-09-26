class Person < ApplicationRecord
  include PgSearch
  has_many :phones
  validates :name, presence: true, length: {minimum: 2}

  scope :ordered_people, -> {all.order(name: :asc)}
  pg_search_scope :search,
                  :against => [:name],
                  :using => {tsearch: {:dictionary => "portuguese", :prefix => true}},
                  :ignoring => :accents
end
