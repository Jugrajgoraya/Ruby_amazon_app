class User < ApplicationRecord
    scope(:search, -> (query){ where("title ILIKE ? OR body ILIKE ?", "#{query}", "#{query}") })

    has_secure_password

    has_many :products
    has_many :reviews
end
