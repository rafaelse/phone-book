class AddDmetaphoneExtension < ActiveRecord::Migration[5.0]
  def up
    execute "create extension fuzzystrmatch"
  end

  def down
    execute "drop extension fuzzystrmatch"
  end
end
