class City < ApplicationRecord
# broadcasts_refreshes
  acts_as_paranoid
has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
end
has_one_attached :video_tour do |attachable|
  attachable.variant :thumb, resize_to_limit: [100, 100], preprocessed: true
end

has_many_attached :images do |attachable|
  attachable.variant :thumb, resize_to_limit: [200, 200]
end 
def pincode 
  "#{country}-#{id.to_s.rjust(5, '0')}"
end

include Entryable
validates :name, presence: true
validates :country, presence: true
  has_many :places, dependent: :destroy 
  validates_associated :places
  accepts_nested_attributes_for :places, allow_destroy: true

 def self.ransackable_attributes(auth_object = nil )
   ["name", "country", "created_at"]
end
end
