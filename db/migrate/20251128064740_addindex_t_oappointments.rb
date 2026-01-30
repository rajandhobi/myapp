class AddindexTOappointments < ActiveRecord::Migration[8.1]
  def change  
      add_index :appointments, [:doctor_id, :patient_id], unique: true
  end
end
