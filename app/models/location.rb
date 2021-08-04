class Location < ApplicationRecord
    has_many :restaurants
    has_many :users, through: :restaurants
    validates :name, presence: true
    # validates :name, uniqueness: true

        # scope :order_by_location, -> {order(:name)}

end
