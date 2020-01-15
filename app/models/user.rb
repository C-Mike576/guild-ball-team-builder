class User < ActiveRecord::Base
    has_secure_password
    validates :username, :presence => true
    has_many :teams
    has_many :players, through: :teams
end
