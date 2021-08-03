class Meal < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    has_many :reviews

    validates :name, :description, presence: true
    
end
