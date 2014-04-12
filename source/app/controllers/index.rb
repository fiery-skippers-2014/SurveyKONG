

#----------- SESSIONS -----------

#splash page, not logged in
get '/' do
  erb :index

end

#Complete A survey

get '/survey/:survey_id/user/:user_id' do
  @current_survey = Survey.find(params[:survey_id])
  @questions = Question.where(survey_id: @current_survey)
  erb :complete_survey
end

post '/survey/:survey_id/user/:user_id' do
  @survey_id = params[:survey_id].to_i
  @completed_survey = CompletedSurvey.create(survey_id: @survey_id,user_id: params[:user_id])
  @questions_count = Survey.find(@survey_id).questions.count
  params_array = params.to_a # turns params into array for indexing
  params_array.each_with_index do |question_and_choice, index|
    if index < @questions_count
     UserAnswer.create(user_id: params[:user_id], question_id: question_and_choice[0].to_i, question_choice_id: question_and_choice[1].to_i, completed_survey_id: @completed_survey.id)
    end
  end

  redirect "/users/#{session[:user_id]}"
end

#User Home Page
get '/users/:id' do
  erb :profile
end

get '/sessions/new' do
  erb :sign_in
end

get '/survey/:id/new' do
  erb :create_survey
end


post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user
    @user = User.authenticate(params[:email], params[:password])
    if @user.errors.full_messages.count != 0
      erb :_errors
    else
      session[:user_id] = @user.id
      redirect ("/users/#{session[:user_id]}")
    end
  else
     erb :_invalid_user
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/viewresults' do
  p "#"*100
  p params[:id]
  if CompletedSurvey.find_by_id(params[:id].to_i) == nil
    redirect back
  else
    @surveys = CompletedSurvey.find_by_id(params[:id].to_i)
  end
  # @surveys = CompletedSurvey.last # Change this to survey clicked!!!!!!
  survey_hash = {}
  @surveys.survey.questions.each do |question|
    true_value = 0
    false_value = 0
    number_of_surveys_completed = 0
    @surveys.user_answers.find_all_by_question_id(question.id).each do |answer|
      if answer.question_choice.choice == "true"
        true_value += 1
      else
        false_value += 1
      end
      number_of_surveys_completed += 1
    end
      survey_hash[question.id] = true_value/(true_value+ false_value)
      survey_hash[0] = number_of_surveys_completed
  end
  survey_hash.to_json
end

post '/survey/:id/new' do

  raw_params = params.to_a # turns params into array for indexing
  p raw_params
  user_data = raw_params.values_at(0,-1, -2, -3, -4) #grabs title, user_id, # of questions, and scrubs other entries

  p user_data
  title = user_data[0]
  user_id = user_data[1]
  total_questions = user_data[-1]
  questions = raw_params - user_data # creates array with just questions
  p questions
  @survey = Survey.create(user_id: user_id[1], title: title[1]) # grabs actual values out of tuplet
  survey_id = @survey.id.to_i
  p @survey

  questions.each do |question|
    question_back = Question.create(survey_id: survey_id, question: question[1]) # will work when questions
    QuestionChoice.create(question_id: question_back.id, choice: "true")
    QuestionChoice.create(question_id: question_back.id, choice: "false")
  end

  redirect "/users/#{session[:user_id]}"
end



# post '/sessions' do
#   @user = User.find_by_email(params[:email])
#   session[:user_id] = @user.id
#   p session[:user_id]
#   redirect ('/')
# end


# delete '/sessions/:id' do
#   session[:user_id] = nil
#   redirect ('/')
# end

# get '/profile/:id' do
#   erb :home
# end

#----------- USERS -----------

get '/user/new' do
  erb :sign_up
end


post '/users' do
  @user = User.create(params)
  if @user.errors.full_messages.count != 0
    erb :_errors
  else
    session[:user_id] = @user.id
    redirect("/users/#{session[:user_id]}")
  end
end

# get '/' do
#   @posts = Post.all
#   erb :index

# end

#--------Voting -----------

