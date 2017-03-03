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

  
end
