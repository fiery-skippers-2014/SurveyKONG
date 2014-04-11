

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

