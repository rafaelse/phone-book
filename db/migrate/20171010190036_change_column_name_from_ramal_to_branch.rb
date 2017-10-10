class ChangeColumnNameFromRamalToBranch < ActiveRecord::Migration[5.0]
  def change
    rename_column :phones, :ramal, :branch
  end
end
