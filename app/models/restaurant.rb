class Restaurant < ApplicationRecord
    has_many :users
    has_many :meals
    has_many :reviews
    belongs_to :location
end
