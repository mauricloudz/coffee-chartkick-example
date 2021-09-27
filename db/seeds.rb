# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2000.times do
    Sale.create(
        blend_name: Faker::Coffee.blend_name,
        origin: Faker::Coffee.origin,
        amount: rand(1990..5490),
        created_at: Faker::Date.between(from: Date.parse("2017-01-01"), to: Date.today)
    )
end