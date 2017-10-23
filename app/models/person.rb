class Person < ApplicationRecord
  has_many :phones
  has_many :divisions, through: :phones
  validates :name, presence: true

  scope :ordered_people, -> {all.order(name: :asc)}

  searchkick word_start: [:name], language: "brazilian"
end
