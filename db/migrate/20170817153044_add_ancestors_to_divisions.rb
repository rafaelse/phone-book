class AddAncestorsToDivisions < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :ancestors, :string
  end
end
