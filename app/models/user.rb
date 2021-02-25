class User < ActiveRecord::Base
    validates :email, presence:true, uniqueness: true
    has_many :intakes
    has_secure_password
end