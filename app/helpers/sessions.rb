helpers do

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def all_surveys
   @all_surveys = Survey.all
  end


end
