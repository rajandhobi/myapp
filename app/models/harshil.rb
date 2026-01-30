class Harshil < ApplicationRecord
validates :name, uniqueness: true, on: :create 
validates :age, presence: true, on: :create
end

