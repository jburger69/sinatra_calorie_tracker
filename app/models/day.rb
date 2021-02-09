class Day < ActiveRecord::Base
    has_many :intakes
    has_many :users, through: :intakes
end