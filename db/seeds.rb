# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "bob", email: "bob@mail.com", password: "123")

5.times do
	Article.create!(title: Faker::Commerce.department, text: Faker::Lorem.sentence, user_id: 1)
end
