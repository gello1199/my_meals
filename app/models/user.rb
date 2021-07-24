class User < ApplicationRecord
    has_many :restaurants
    has_many :locations
    has_many :meals
    has_many :reviews, through: :meals
end
