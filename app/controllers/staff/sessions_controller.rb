class Staff::SessionsController < Staff::Base
  def new
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Staff::LoginForm.new(params[:staff_login_form])
    # Staff::LoginFormは非ActiveRecordモデルで、インスタンス生成
    if @form.email.present?
      staff_member = StaffMember.find_by(email_for_index: @form.email.downcase)
    end
    if Staff::Authenticator.new(staff_member).authenticate(@form.password)
      session[:staff_member_id] = staff_member.id
      # sessionオブジェクトにstaffmemberのid属性の値をセット
      # sessionオブジェクトはリダレクト先でも参照できる
      # ;staff_member_idキーに値がセットされていることがログインしている状態を表す
      redirect_to :staff_root
    else
      render action: 'new'
    end
  end

  def destroy
    session.delete(:staff_member_id)
    redirect_to :staff_root
  end

end
