class AddTrigramExtension < ActiveRecord::Migration[5.0]
  def up
    execute "create extension pg_trgm"
  end

  def drop
    execute "drop extension pg_trgm"
  end
end
