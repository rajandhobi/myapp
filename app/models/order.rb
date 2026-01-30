class Order < ApplicationRecord
  belongs_to :customer

  validates :total, presence: true, numericality: { greater_than: 0}
  validates :status, presence: true, exclusion: { in: ["pending", "complete", "reject" ]}
  
  before_save :round_total
  after_create :order_notification

private

def round_total
  self.total = total.round(2)
end

def order_notification
  puts "Order created for #{customer.name} worth is #{total}"
end
end