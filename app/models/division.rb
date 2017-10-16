class Division < ApplicationRecord
  include PgSearch
  has_many :phones
  has_many :people, through: :phones
  belongs_to :parent_division, optional: true, class_name: 'Division', foreign_key: 'parent_id'
  accepts_nested_attributes_for :parent_division
  has_many :subdivisions, class_name: 'Division', foreign_key: 'parent_id', dependent: :destroy

  validates :name, presence: true

  pg_search_scope :search,
                  :against => [:name],
                  :using => {tsearch: {:dictionary => "portuguese", :prefix => true}},
                  :ignoring => :accents

  scope :root_divisions, -> {where(parent_id: nil).order(name: :asc)}
  scope :children_divisions, -> (parent_id)  {where(parent_id: parent_id).order(name: :asc)}

  multisearchable :against => [:name]

  def parent_division_attributes=(attributes)
    if attributes['id'].present?
      self.parent_division = Division.find(attributes['id'])
    end
    super
  end

  def self.root_search(term)
    Division.root_divisions.search(term)
  end

  def self.children_search(parent_id, term)
    Division.children_divisions(parent_id).search(term)
  end
end
