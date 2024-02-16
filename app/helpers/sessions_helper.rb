module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end
  def logged_in?
    session[:user_id] &&  current_user ? true : false
  end
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  def is_owner_of_gossip?(id)
    Gossip.find(id).author == current_user
  end
  def is_owner_of_comment?(id)
    Comment.find(id).commenting_user == current_user
  end
end
