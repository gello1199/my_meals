class Restaurant < ApplicationRecord
    has_many :meals, dependent: :destroy
    has_many :users, through: :meals
    belongs_to :location
    validates :name, presence: true
    accepts_nested_attributes_for :meals, reject_if: proc { |attributes| attributes['name'].blank? || attributes['description'].blank?}


    # scope :order_by_location, -> {find_by_sql("SELECT * FROM locations INNER JOIN restaurants ON locations.id = restaurants.location_id ORDER BY locations.name")}
    scope :order_by_location, -> {joins(:location).order("locations.name")}
    scope :search_by_location, -> (location) {joins(:location).where(["locations.name LIKE ?","%#{location}%"])}

    def location_attributes=(location_hash) #elimates duplicate locations and capitalizes first letter in location name
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
