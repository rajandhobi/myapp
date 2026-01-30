class CreateBirthdaycakes < ActiveRecord::Migration[8.1]
  def change
    create_table :birthdaycakes do |t|
      t.timestamps
    end
  end
end
