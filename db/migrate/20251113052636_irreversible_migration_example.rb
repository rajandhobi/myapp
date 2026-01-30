class IrreversibleMigrationExample < ActiveRecord::Migration[8.1]
  def up
execute "DELETE FROM students WHERE name LIKE 'e%'"
  end

  def down
  raise ActiveRecord::IrreversibleMigration, "Cannot be restore deleted data"
  end
end
