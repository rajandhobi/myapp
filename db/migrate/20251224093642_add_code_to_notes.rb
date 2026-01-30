class AddCodeToNotes < ActiveRecord::Migration[8.1]
  def change
    add_column :notes, :code, :string
  end
end
