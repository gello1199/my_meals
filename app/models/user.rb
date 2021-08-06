class User < ApplicationRecord
    has_many :meals
    has_many :restaurants, through: :meals
    validates :email, :first_name, presence: true
    validates :email, uniqueness: true
    has_secure_password
    

    def self.from_omniauth(auth)
        User.find_or_create_by(provider: auth[:provider], uid: auth[:uid])do |u|
        u.email = auth[:info][:email]
        u.first_name = auth[:info][:name]
        u.password = SecureRandom.hex(15)
        end
    end

end
