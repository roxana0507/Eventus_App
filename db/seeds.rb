# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker' 

Guest.destroy_all

50.times do
    Guest.create(
        name: Faker::Name.name_with_middle,
        email: Faker::Internet.email,
        password: Faker::Internet.password 
    )
end
Guest.all.each { |guest| puts guest.email }
