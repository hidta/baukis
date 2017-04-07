class Staff::Base < ApplicationController

  private
  def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||=
      StaffMember.find_by(id: seddion[:staff_member_id])
    end
  end
  # sessionはセッションオブジェクトを返すメソッド
  # セッションオブジェクトはRailsアプリがクライアントごとに保持するデータで通常のハッシュ同様読み書き可能
  # このオブジェクトに:staff_member_idというキーがあれば@current_staff_memberにセット  

  helper_method :current_staff_member
  #helper_methodは引数に指定したシンボルと同盟のメソッドをヘルパーメソッドとして登録するメソッド

end