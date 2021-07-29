class Restaurant < ApplicationRecord
    has_many :meals
    has_many :users, through: :meals
    has_many :reviews, through: :meals
    belongs_to :location

    
end
