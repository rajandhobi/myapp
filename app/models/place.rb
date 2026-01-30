class Place < ApplicationRecord
  validates :name,  presence: true
  validates :category, presence: true
  include Entryable
  belongs_to :city
  
end
