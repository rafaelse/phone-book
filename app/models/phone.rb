class Phone < ApplicationRecord
  include PgSearch
  belongs_to :person
  accepts_nested_attributes_for :person
  belongs_to :division
  accepts_nested_attributes_for :division

  validates :branch, presence: true, format: {with: /[0-9]{4}/}
  validates :ddr, presence: true, format: {with: /\([0-9]{2}\)\s[0-9]{4}\s[0-9]{4}/}, allow_blank: true

  pg_search_scope :search, :against => [:ddr, :branch],
                  :associated_against => {division: [:name],
                                          person: [:name]},
                  :using => {tsearch: {:dictionary => "portuguese", :prefix => true}, dmetaphone: {}, trigram: {:threshold => 0.3}},
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

  def person_attributes=(attributes)
    if attributes['id'].present?
      self.person = Person.find(attributes['id'])
    end
    super
  end

  def division_attributes=(attributes)
    if attributes['id'].present?
      self.division = Division.find(attributes['id'])
    end
    super
  end
end
