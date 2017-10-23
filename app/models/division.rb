class Division < ApplicationRecord
  has_many :phones
  has_many :people, through: :phones
  belongs_to :parent_division, optional: true, class_name: 'Division', foreign_key: 'parent_id'
  accepts_nested_attributes_for :parent_division
  has_many :subdivisions, class_name: 'Division', foreign_key: 'parent_id', dependent: :destroy

  validates :name, presence: true

  scope :root_divisions, -> {where(parent_id: nil)}

  searchkick word_start: [:name], language: "brazilian"

  def parent_division_attributes=(attributes)
    if attributes['id'].present?
      self.parent_division = Division.find(attributes['id'])
    end
    super
  end

  def self.root_search(term)
    Division.search term, fields: [:name], where: {parent_id: nil}, match: :word_start
  end

  def self.children_search(parent_id, term)
    Division.search term, where: {parent_id: parent_id}, fields: [:name], match: :word_start
  end

  def path
    path = []
    division = self
    while division
      path.unshift division
      division = division.parent_division
    end
    return path
  end
end
