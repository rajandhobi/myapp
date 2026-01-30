# class Person
#   include ActiveModel::Model

#   attr_accessor :full_name
#   alias_attribute :name, :full_name
# end


# class Person
#   extend ActiveModel::Callbacks

#  define_model_callbacks :update
#   before_update :reset_me
#   after_update :finalize_me
#   around_update :log_me

#   def update
#     run_callbacks(:update) do
#       puts "update method called"
#     end
#   end

#   private
#     def reset_me
#       puts "reset_me method: called before the update method"
#     end

#     def finalize_me
#       puts "finalize_me method: called after the update method"
#     end

#     def log_me
#       puts "log_me method: called around the update method"
#       yield
#       puts "log_me method: block successfully called"
#     end
# end




# class Person 
#   extend ActiveModel::Callbacks

# define_model_callbacks :create, only: [:before, :after]

# before_Create  personalcallback
# after_create :log_after

# def log_after
#   puts "running this after"
# end

# def create
#   run_callbacks (:create) do 
#     puts "creating data"

#   class personalcallback
#     def self.before_create(obj)
#       puts " class before creating person #{obj.inspect}"
#     end
#   end




  # class Person
#   include ActiveModel::Model
#   extend ActiveModel::Callbacks

#   attr_accessor :name
#   define_model_callbacks :create

#   before_create :check_name
#   after_create  :send_email

#   def check_name
#     puts "Checking name..."
#     throw(:abort)   
#   end

#   def send_email
#     puts "Sending email..."  
#   end

#   def create
#     run_callbacks :create do
#       puts "Saving person..."
#     end
#   end
# end



# class Person
# include ActiveModel::Model
# extend ActiveModel::Callbacks

#   define_model_callbacks :update
#   before_update :reset_me
#   after_update :finalize_me
#   around_update :log_me

#   def update
#     run_callbacks(:update) do
#       puts "update method called"
#     end
#   end

#   private
#     def reset_me
#       puts "reset_me method: called before the update method"
#          throw :abort
#     end

#     def finalize_me
#       puts "finalize_me method: called after the update method"
#     end

#     def log_me
#       puts "log_me method: called around the update method"
#       yield
#       puts "log_me method: block successfully called"
#     end
# end



# class Person
#   include ActiveModel::Model
#   include ActiveModel::Conversion
#   attr_accessor :id, :name

#   def persisted?
#     id.present?
#   end
# end



# class Person
#   include ActiveModel::Dirty

#   define_attribute_methods :name, :age

#   def initialize(name: nil, age: nil)
#     @name = name
#     @age  = age
#     clear_changes_information   
#   end

#   def name
#     @name
#   end

#   def name=(value)
#     name_will_change! unless value == @name
#     @name = value
#   end

#   def age
#     @age
#   end

#   def age=(value)
#     age_will_change! unless value == @age
#     @age = value
#   end

#   def save
#     changes_applied
#   end
# end


 # class Person 
 # include ActiveModel::SecurePassword
 # has_secure_password
 # has_secure_password :recovery_password, validations: false 
 # attr_accessor :password_digest, :recovery_password_digest
 # end
  
# class Person
#   include ActiveModel::Model
#   include ActiveModel::Serialization

#   attr_accessor :name, :age

#   def attributes
#     {
#       "name" => name,
#       "age"  => age
#     }
#   end

#   def capitalized_name
#     {
#       "name" => name&.capitalize

#     }
#   end
# end

#  class Person
#     include ActiveModel::Serializers::JSON
#     attr_accessor :name

# def attributes=(hash)
#   hash.each do |key, value|
#     public_send("#{key}=", value)
# end
# end

# def attributes 
#   {"name" => nil}
# end
# end

class Person
  # extend  ActiveModel::Translation
  include ActiveModel::API
end



