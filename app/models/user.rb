class User < ApplicationRecord
    has_many :meals
    has_many :restaurants, through: :meals
    has_many :reviews, through: :meals
    validates :email, :first_name, presence: true
    validates :email, uniqueness: true
    has_secure_password
end
