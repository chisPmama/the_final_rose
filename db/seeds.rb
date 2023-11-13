# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
@matthew = @hannah.contestants.create!(name: "Matthew Spraggins", age: 23, hometown: "Newport Beach, California")
@brian = @hannah.contestants.create!(name: "Brian Bowles", age: 30, hometown: "Louisville, Kentucky")
@chasen = @hannah.contestants.create!(name: "Chasen Coscia", age: 27, hometown: "Longview, Washington")
@hunter = @hannah.contestants.create!(name: "Hunter Jones", age: 24, hometown: "Westchester, California")
@test = Bachelorette.create!(name: "candy", season_number: 15, description: "The Most Dramatic Season Yet!")
@test.contestants.create!(name: "test", age: 100, hometown: "mars")