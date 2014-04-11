

#----------- SESSIONS -----------

get '/sessions/new' do

  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  session[:user_id] = @user.id
  p session[:user_id]
  redirect ('/')
end

get '/post/:id/new' do
  erb :create_post
end

post '/post/:id/new' do
  new_post = Post.create(title: params[:title], body: params[:body])
  current_user.posts << new_post
  redirect('/')
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect ('/')
end

get '/profile/:id' do
  erb :profile
end

get '/posts/:id/all' do
  @current_user = current_user
  @user_posts = @current_user.posts
  erb :user_posts
end

post '/post/:id/comment' do
  new_comment = Comment.create(comment: params[:comment],post_id: params[:id])
  # current_post = Post.find(params)
  current_user.comments << new_comment
  # current_post.comments << new_comment

  redirect back
end

get '/comments/:id/all' do
  @current_user = current_user
  @user_comments = @current_user.comments

  erb :user_comments
end
#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  User.create(params)
  redirect('/')
end

get '/post/:id' do
  @post = Post.find(params[:id])


  @comments = @post.comments
  erb :show_post
end



get '/' do
  @posts = Post.all
  erb :index

end

#--------Voting -----------

post '/postvote' do
  params[:user_id] = session[:user_id]
  @postvote = PostVote.create(user_id: params[:user_id],post_id: params[:post])
  # @vote_count = PostVote.find_all_by_post_id(params[:go]).length
  # @vote_count.to_json
  {post_id: @postvote.post_id, votecount: PostVote.find_all_by_post_id(params[:post]).length }.to_json
end

post '/postcomment' do
  params[:user_id] = session[:user_id]
  @commentvote = CommentVote.create(user_id: params[:user_id], comment_id: params[:comment])
  # @commentvote.votecount =
  # @commentvote.save
  {comment_id: @commentvote.comment_id, votecount: CommentVote.find_all_by_comment_id(params[:comment]).length}.to_json
end