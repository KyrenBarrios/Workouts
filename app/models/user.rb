class User < ActiveRecord::Base
    has_many :workouts
    has_secure_password 
    validates :username, presence: true #This will check if the username is empty or not
end