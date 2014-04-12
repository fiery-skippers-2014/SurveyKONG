require 'faker'


x = 10
# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
5.times do
  User.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password')
end

1.times do
  Survey.create(user_id: 1, title: Faker::Lorem.word, description: Faker::Lorem.sentence)
end


counter = 1
5.times do
  Question.create(survey_id: 1, question: Faker::Lorem.sentence)
  y  = ["true", "false"]
  y.each do |z|
    QuestionChoice.create(question_id: counter, choice: z)
  end
  counter += 1
end

1.times do
 CompletedSurvey.create(user_id: 1, survey_id: 1)
end

user_counter = 1


5.times do
question_choice_counter = 1
question_counter = 1
  4.times do
    UserAnswer.create(user_id: user_counter, question_choice_id: question_choice_counter, completed_survey_id: 1, question_id: question_counter)
    question_counter += 1
    question_choice_counter += 2
  end

  UserAnswer.create(user_id: user_counter, question_choice_id: 10, completed_survey_id: 1, question_id: 5)
  user_counter += 1
end
