class Restaurant < ApplicationRecord
    has_many :meals, dependent: :destroy
    has_many :users, through: :meals
    has_many :reviews, through: :meals
    belongs_to :location
    validates :name, presence: true

    accepts_nested_attributes_for :meals

    # scope :order_by_location, -> {order(location: :name)}
    # scope :order_by_location, -> {where(location: :asc)}

    def location_attributes=(location_hash)
    # byebug
        if !location_hash[:name].blank?
            capital_name = cap_name(location_hash)
            self.location = Location.find_or_create_by(name: capital_name)
        end
    end

    def cap_name(location)
        location[:name].split(" ").map {|n| n.capitalize}.join(" ")
    end

end
