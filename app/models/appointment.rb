class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validates :patient_id, uniqueness: { scope: :doctor_id }
  has_one  :report
end
