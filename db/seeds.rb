# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Product.destroy_all
Tag.destroy_all

NUM_PRODUCT = 35
NUM_USER = 10
TAG_NUM = 7
PASSWORD = 'supersecret'

super_user = User.create(
    first_name: 'yuvi',
    last_name: 'goraya',
    email: 'yuvi@goraya.gov',
    password: PASSWORD
)

TAG_NUM.times do 
    Tag.create({
        name: Faker::Game.genre
    })
end

NUM_PRODUCT.times do
    p = Product.create({
        title: Faker::Hacker.noun,
        description: Faker::Hacker.say_something_smart,
        price: Faker::Commerce.price,
        user_id: super_user.id
    })
    if p.valid?
        rand(0..10).times.each do
            Review.create(
                rating: Faker::Number.between(from:1, to:5),
                body: Faker::Hipster.paragraph,
                product: p,
                user_id: super_user.id
            )
        end
    end
end



puts Cowsay.say("Generated #{Product.all.count} products", :frogs)
puts Cowsay.say("Generated #{Review.all.count} reviews", :tux)
puts Cowsay.say("Generated #{Tag.all.count} tags", :kitty)