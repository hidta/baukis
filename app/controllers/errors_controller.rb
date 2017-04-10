class ErrorsController < ApplicationController
  def routing_error
    raise ActionController::RoutingError,
      "No route matchs #{request.path.inspect}"
  end
  # raiseは第一引数に例外クラス、第二引数にメッセージを指定する
  # requestはクライアントからのリクエストに関する情報を保持するオブジェクト
  # .pahtでURLのパスの部分をかえしている
  # inspectメソッドはそれ自身を人間が読める文字列に変換すること

end
