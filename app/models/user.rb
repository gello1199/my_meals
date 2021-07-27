class User < ApplicationRecord
    has_many :meals
    has_many :restaurants, through: :meals
    has_many :reviews, through: :meals
    has_secure_password
end
