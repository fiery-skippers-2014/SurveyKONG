

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


post '/survey/:id/new' do

  raw_params = params.to_a # turns params into array for indexing
  user_data = raw_params.values_at(0,-1, -2, -3, -4) #grabs title, user_id, # of questions, and scrubs other entries
  title = user_data[0]
  user_id = user_data[1]
  total_questions = user_data[-1]
  questions = raw_params - user_data # creates array with just questions

  @survey = Survey.create(user_id: user_id[1], title: title[1]) # grabs actual values out of tuplet
  survey_id = @survey.id.to_i

  questions.each do |question|
    question_back = Question.create(survey_id: survey_id, question: question[1]) # will work when questions
    p question_back.id
    QuestionChoice.create(question_id: question_back.id, choice: "true")
    QuestionChoice.create(question_id: question_back.id, choice: "false")
  end

  redirect '/'
end


# post '/sessions' do
#   @user = User.find_by_email(params[:email])
#   session[:user_id] = @user.id
#   p session[:user_id]
#   redirect ('/')
# end

get '/sessions/new' do

end


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

