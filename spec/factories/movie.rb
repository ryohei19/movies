FactoryBot.define do
  factory :movie do
    name { Faker::Lorem.characters(number:10) }
    rate { Faker::Number.between(from: 0, to: 5)}
    review { Faker::Lorem.characters(number:100) }
    spoiler { Faker::Lorem.characters(number:100) }
    user
    genre
  end
end