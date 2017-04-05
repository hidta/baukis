class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout

  private
  
  def set_layout
    if params[:controller].match(%r{\A( staff | admin | customer )})
      Regexp.last_match[1]
    else
      'customer'
    end
  end
  #set_layoutは staff, admin, customer のどれかを返し、それがレイアウトの名前として使用される

end

#レイアウト決定の優先度
#コントローラ名と同名のレイアウトが選択、なければapplicationレイアウトが選択される
