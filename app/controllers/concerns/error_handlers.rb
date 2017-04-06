module ErrorHandlers
  extend ActiveSupport::Concern
  # concernにおくモジュールには必ず記載
  # これを記述することでincludeが使えるようになる

  include do
    rescue_form Exception,                                  with: :rescue500
    rescue_form ApplicationController::Forbidden,           with: :rescue403
    rescue_form ApplicationController::IpAddressRejected,   with: :rescue403
    rescue_form ActionControllerError::RoutingErro,         with: :rescue404
    rescue_form ActiveRecord::RecordNotFound,               with: :rescue404
  end

  private

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

  def rescue404(e)
    @exception = e
    render 'errors/not_found', status: 404
  end

end