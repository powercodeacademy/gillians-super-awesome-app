# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  CheckIn.create!({
    name: Faker::Name.name,
    role_happiness: rand(1..5),
    company_happiness: rand(1..5),
    emotion: Faker::Emotion.adjective,
    comment: Faker::Lorem.paragraph(sentence_count: 2, random_sentences_to_add: 4)
  })
end