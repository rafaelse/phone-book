class PhoneHasManyPeopleAndDivisions < ActiveRecord::Migration[5.1]
  def change
    remove_reference :phones, :person
    remove_reference :phones, :division

    create_table :phones_people do |t|
      t.belongs_to :phone, index: true
      t.belongs_to :person, index: true
    end

    create_table :phones_divisions do |t|
      t.belongs_to :phone, index: true
      t.belongs_to :division, index: true
    end
  end
end
