module SessionsHelper 
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user.present?
  end
  
  def authenticate_user
    if not logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to new_session_path
    end
  end
end
