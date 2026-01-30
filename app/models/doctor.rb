class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, -> { distinct }, through: :appointments
  has_and_belongs_to_many :courses
end

