class User < ApplicationRecord
    scope(:search, -> (query){ where("title ILIKE ? OR body ILIKE ?", "#{query}", "#{query}") })

    has_secure_password

    has_many :products
    has_many :reviews
    has_many :favourites
    has_many :favourite_products, through: :favourites, source: :product

    has_many :likes
    has_many :liked_reviews, through: :likes, source: :review
end
