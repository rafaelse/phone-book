class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :ddr
      t.string :ramal
      t.belongs_to :person, foreign_key: true
      t.belongs_to :division, foreign_key: true

      t.timestamps
    end
  end
end
