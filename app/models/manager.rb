class Manager < ActiveRecord::Base
    has_many :comments
    has_secure_password
end
