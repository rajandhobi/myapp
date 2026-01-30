class Snack < ApplicationRecord
  has_many :pictures, as: :imageable
  belongs_to :product
end
