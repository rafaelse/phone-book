class ChangePhoneNumberType < ActiveRecord::Migration[5.0]

  def up
    remove_column :phones, :ddr
    remove_column :phones, :ramal
    add_column :phones, :ddr, :integer, limit: 8
    add_column :phones, :ramal, :integer, limit: 2
  end

  def down
    change_column :phones, :ddr, :string
    change_column :phones, :ramal, :string
  end
end
