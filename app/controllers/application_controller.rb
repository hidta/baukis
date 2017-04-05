class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout
  
  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  rescue_form Exception,         with: :rescue500
  rescue_form Forbidden,         with: :rescue403
  rescue_form IpAddressRejected, with: :rescue403

  private
  
  def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)})
      Regexp.last_match[1]
    else
      'customer'
    end
  end
  #set_layoutは staff, admin, customer のどれかを返し、それがレイアウトの名前として使用される
  #レイアウト決定の優先度#レイアウト決定の優先度
  #コントローラ名と同名のレイアウトが選択、なければapplicationレイアウトが選択される

  def rescue500(e)
    @exception = e
    render 'errors/internal_server_error', status: 500
  end
  #rescueはクラス・メソッド
  #例外が発生したらrescue500に処理を渡す
  #renderでerrors/internal_server_error.html.erbを生成して表示

  def rescue403(e)
    @exception = e
    render 'errors/forbidden', status: 403
  end

end
