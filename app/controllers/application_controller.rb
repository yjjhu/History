class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :datemach
  def datemach (b, e)
    if b.year == e.year
      if b.mon == e.mon
        if b.mday == e.mday
          "#{b.year}年#{b.mon}月#{b.mday}日"
        else
          "#{b.year}年#{b.mon}月#{b.mday}-#{e.mday}日"
        end
      else
        "#{b.year}年#{b.mon}月#{b.mday}日-#{e.mon}月#{e.mday}日"
      end
    else
      "#{b.year}年#{b.mon}月#{b.mday}日-#{e.year}年#{e.mon}月#{e.mday}日"
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
  
end
