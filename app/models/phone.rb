class Phone < ApplicationRecord
  include PgSearch
  belongs_to :person
  belongs_to :division

  validates_associated :person, :division
  validates :ramal, presence: true, format: {with: /[0-9]{4}/}
  validates :ddr, presence: true, format: {with: /\([0-9]{2}\)\s[0-9]{4}\s[0-9]{4}/}, allow_blank: true

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
