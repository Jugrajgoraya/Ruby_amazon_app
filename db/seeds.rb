# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
NUM_PRODUCT = 1000
NUM_USER = 10
PASSWORD = 'supersecret'

super_user = User.create(
    first_name: 'yuvi',
    last_name: 'goraya',
    email: 'yuvi@goraya.gov',
    password: PASSWORD
)


NUM_PRODUCT.times do
    created_at = Faker::Date.backward(days: 365 * 5)
    Product.create(
         title: Faker::Hacker.say_something_smart,
         description: Faker::ChuckNorris.fact,
         price: Faker::Number.number(digits: 2),#number_to_currency(@product.price) 
         created_at: created_at,
         updated_at: created_at
     )
end