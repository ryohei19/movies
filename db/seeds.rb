# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.create!(
                  name: "test1",
                  rate: "3.5",
                  review: "test1",
                  spoiler: "test1",
                  genre_id: "3",
                  user_id: "1"
                  )