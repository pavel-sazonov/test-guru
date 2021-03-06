# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.create!([
#   { email: 'admin@testguru.ru', first_name: 'Pavel', last_name: 'Sazonov',
#                password: '134679', type: 'Admin' },
#   ])
# puts 'Users was created!'

category = Category.create!([
  { title: 'frontend'},
  { title: 'backend'}
  ])
puts 'Categories was created!'

test = Test.create!([
  { title: 'Html', level: 1, category_id: 1, user_id: 10 },
  { title: 'CSS', level: 1, category_id: 1, user_id: 10 },
  { title: 'Javascript', level: 1, category_id: 1, user_id: 10 },
  { title: 'Ruby', level: 2, category_id: 2, user_id: 10 },
  { title: 'Rails', level: 3, category_id: 2, user_id: 10 },
  ])
puts 'Tests was created!'

question = Question.create!([
  { body: 'Which tag is used to refer to a paragraph?', test_id: 1 },
  { body: 'Which tag is used to set background color?', test_id: 2 },
  { body: 'Show syntax to define a new function?', test_id: 3 },
  { body: 'What method does use to show amount of elements in array?', test_id: 4 },
  { body: 'How to start a local server?', test_id: 5 },
  ])
puts 'Questions was created!'

answer = Answer.create!([
  { body: '<p>', correct: true, question_id: 1 },
  { body: '<br>', correct: false, question_id: 1 },
  { body: 'background-color', correct: true, question_id: 2},
  { body: 'color', correct: false, question_id: 2},
  { body: 'function name(parameters) {};', correct: true, question_id: 3},
  { body: 'func name(parameters) {};', correct: false, question_id: 3},
  { body: 'count', correct: true, question_id: 4},
  { body: 'size', correct: true, question_id: 4},
  { body: 'elements', correct: false, question_id: 4},
  { body: 'rails s', correct: true, question_id: 5},
  { body: 'rails server', correct: true, question_id: 5},
  { body: 'rails c', correct: false, question_id: 5},
  ])
puts 'Answers was created!'




