# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.new(
   name: 'testtest',
   password: 'testtest',
).save(validate: false)

Genre.create!([
  { name: '餅菓子'},
  { name: '蒸し菓子'},
  { name: '焼き菓子'},
  { name: '流し菓子'},
  { name: '練り菓子'},
  { name: 'おか菓子'},
  { name: '干菓子'},
  { name: 'その他'},
])
