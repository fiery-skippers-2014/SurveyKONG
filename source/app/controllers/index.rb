

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
  session[:user_id] = @user.id
  p session[:user_id]
  redirect ("/users/#{session[:user_id]}")
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

get '/users/new' do
  erb :sign_up
end




post '/users' do
  User.create(params)
  redirect('/')
end

# get '/' do
#   @posts = Post.all
#   erb :index

# end

#--------Voting -----------

