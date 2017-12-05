# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = Category.create([
  { title: 'frontend'},
  { title: 'backend'},
  { title: 'mobile'}
  ])

test = Test.create([
  { title: 'Html', level: 0, category_id: 1 },
  { title: 'CSS', level: 0, category_id: 1 },
  { title: 'Javascript', level: 1, category_id: 1 },
  { title: 'Ruby', level: 2, category_id: 2 },
  { title: 'Rails', level: 3, category_id: 2 },
  { title: 'Swift', level: 2, category_id: 3 },
  ])


