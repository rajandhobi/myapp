class Product < ApplicationRecord
scope :expensive, -> { where("price > 500")}
scope :with_price, ->{ where(price: 1300)}
scope :stock, -> { where(stock: 5)}
scope :with_name, ->(value) { where(name: value)}


  has_many :snacks
  # validates_associated :students
  before_save :format_name
  around_save :log_sav_process
  after_save :update_serach
  after_destroy :log_destroy_action

  def format_name
    self.name = name.to_s.titleize
    Rails.logger.info("Name formatted to: #{name}")
  end

def log_sav_process 
    Rails.logger.info("Saving product: #{name}")
    yield
    Rails.logger.info("Product saved: #{name}")
end

def update_serach
  Rails.logger.info("Updating search for product #{name}")
end

def log_destroy_action
  Rails.logger.info("Products Destroyed")
end
end

