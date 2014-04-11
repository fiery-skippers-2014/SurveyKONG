require 'faker'


x = 10
# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
x.times do
  User.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password')
end

x.times do
  Survey.create(user_id: rand(1..x), title: Faker::Lorem.word, description: Faker::Lorem.sentence)
end

x.times do
  Question.create(survey_id: rand(1..x), question: Faker::Lorem.sentence)
end

y  = [true, false]
x.times do
  QuestionChoice.create(question_id: rand(1..x), choice: y.sample)
end

x.times do
  UserAnswer.create(user_id: rand(1..x), question_choice_id: rand(1..x), completed_survey_id: rand(1..x))
end

x.times do
 CompletedSurvey.create(user_id: rand(1..x), survey_id: rand(1..x))
end


