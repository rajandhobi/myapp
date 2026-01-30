class Customer < ApplicationRecord
  
  has_many :orders, dependent: :destroy

  validates :name, presence: true,
                   length: {
                     minimum: 5,
                     too_short: "Minimum %{count} characters required"
                   }

  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation :normalize_name
  after_create :welcome_message

  private

  def normalize_name
    if self[:name].present?
      self[:name] = self[:name].capitalize
    end
  end

  def welcome_message
    puts "New customer '#{read_attribute(:name)}' added successfully!"
  end
end
