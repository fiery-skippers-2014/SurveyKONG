

#----------- SESSIONS -----------

#splash page, not logged in
get '/' do
  erb :index
end

#User Home Page
get '/users/:id' do
  erb :profile
end

get '/sessions/new' do
  erb :sign_in
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

get '/viewresults' do
  erb :temp_profile
end

post '/viewresults' do
  @surveys = CompletedSurvey.last # Change this to survey clicked!!!!!!


  survey_hash = {}

@surveys.survey.questions.each do |question|
  p question
  p "HEREHREHREHREHREHREREH"
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
  # .to_json

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

