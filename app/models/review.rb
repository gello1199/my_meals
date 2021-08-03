class Review < ApplicationRecord
    belongs_to :meal

    validates :title, :comment, :rating, presence: true
end
