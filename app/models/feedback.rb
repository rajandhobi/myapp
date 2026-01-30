class Feedback 
  include ActiveModel::API

  attr_accessor :name, :rating, :comment
  validates :name, presence: true
  validates :rating, presence: true
  validates :comment, presence: true, length: {minimum: 20}

def save 
   valid?
end
end
