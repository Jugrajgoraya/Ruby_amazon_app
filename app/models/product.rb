class Product < ApplicationRecord

    validates(:title, presence: true, uniqueness: true)
    validates(
        :description,
        presence: { message: "must exist" },
        length: { minimum: 10 }
    )
    validates(
        :price,
        numericality: { greater_than: 0 }
    )

    # A callback method to set the default price to 1
    # A callback method to capitalize the product title before saving

    before_validation(:set_default_price)

    # before_saving(:capitalize_the_title)

    scope(:search, -> (query){ where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%") })

    private

    def capitalize_the_title
        title = title.capitalize
    end

    def set_default_price
        self.price ||= 1
    end

end
