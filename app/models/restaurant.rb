class Restaurant < ApplicationRecord
    has_many :meals
    has_many :users, through: :meals
    has_many :reviews, through: :meals
    belongs_to :location
    validates :name, presence: true
    validates :location_id, presence: true

    accepts_nested_attributes_for :meals

    def location_attributes=(location_hash)
    # byebug
        if !location_hash[:name].blank?
            self.location = Location.find_or_create_by(location_hash)
        end
    end

end
