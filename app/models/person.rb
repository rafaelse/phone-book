class Person < ApplicationRecord
  has_many :phones

  scope :ordered_people, -> {all.order(name: :asc)}
end
