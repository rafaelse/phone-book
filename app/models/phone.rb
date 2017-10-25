class Phone < ApplicationRecord
  has_and_belongs_to_many :people
  # accepts_nested_attributes_for :person
  has_and_belongs_to_many :divisions
  # accepts_nested_attributes_for :division

  validates :branch, presence: true, format: {with: /[0-9]{4}/}
  validates :ddr, presence: true, format: {with: /\([0-9]{2}\)\s[0-9]{4}\s[0-9]{4}/}, allow_blank: true
  validates_uniqueness_of :ddr, scope: :branch

  searchkick

  # def office
  #   division.parent_division.parent_division
  # end
  #
  # def department
  #   division.parent_division
  # end
  #
  # def sector
  #   division
  # end

  # def person_attributes=(attributes)
  #   if attributes['id'].present?
  #     self.person = Person.find(attributes['id'])
  #   end
  #   super
  # end
  #
  # def division_attributes=(attributes)
  #   if attributes['id'].present?
  #     self.division = Division.find(attributes['id'])
  #   end
  #   super
  # end
end
