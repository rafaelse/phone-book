class AddIndexToSearchableFields < ActiveRecord::Migration[5.1]

  def up
    add_index :phones, :ddr
    add_index :phones, :branch
    add_index :people, :name
    add_index :divisions, :name
  end

  def down
    remove_index :phones, :ddr
    remove_index :phones, :branch
    remove_index :people, :name
    remove_index :divisions, :name
  end
end
