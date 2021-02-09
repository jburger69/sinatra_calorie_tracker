class User < ActiveRecord::Base
    has_many :intakes
    has_many :days, through: :intakes
    has_secure_password
end