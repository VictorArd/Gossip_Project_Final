module SessionHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

   def log_in(user)
    session[:user_id] = user.id
  end

  def is_current_author(userid)
    if current_user.nil? || current_user.id != userid
      false
    else
      true
    end
  end

end
