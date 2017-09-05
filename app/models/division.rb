class Division < ApplicationRecord
  has_many :phones
  has_many :people, through: :phones
  belongs_to :parent_division, optional: true, class_name: 'Division', foreign_key: 'parent_id'
  has_many :subdivisions, class_name: 'Division', foreign_key: 'parent_id', dependent: :destroy

  before_save :update_ancestors

  scope :secretaries, -> {where(parent_id: nil).order(name: :asc)}
  scope :departments, -> (sec_id) {where(parent_id: sec_id).order(name: :asc)}
  scope :sectors, -> (dept_id) {where(parent_id: dept_id).order(name: :asc)}

  private

  def update_ancestors(parent = parent_division, new_ancestors = '')
    unless parent
      self.ancestors = new_ancestors
      return
    end
    update_ancestors(parent.parent_division, "#{new_ancestors} #{parent.name}")
  end
end
