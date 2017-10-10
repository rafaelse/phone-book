class RemoveAncestorsFromDivisions < ActiveRecord::Migration[5.0]
  def up
    remove_column :divisions, :ancestors, :string
  end

  def down
    add_column :divisions, :ancestors, :string
  end
end
