class Users::SessionsController < Devise::SessionsController

before_action :user_state, only: [:create]

# お試しログインの記述
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'お試し機能でログインしました'
  end

  private
    # 退会しているかを判断するメソッド
  def user_state
  #.処理1、入力されたemailからアカウント1件取得
    @user = User.find_by(email: params[:user][:email])
  # アカウントを取得出来なければ、メソッドを終了
    return if !@user
  # 処理2、取得したアカウントのパスワードと入力されたものが正しいか判別
    if @user.valid_password?(params[:user][:password]) && !@user.is_active
      flash[:notice] = "退会済みです。再度ご登録してご利用下さい。"
      redirect_to new_user_registration_path
    end
  end

end
