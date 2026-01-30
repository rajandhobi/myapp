class User < ApplicationRecord
  rolify
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable,
         :lockable,
         :timeoutable
  # validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
  