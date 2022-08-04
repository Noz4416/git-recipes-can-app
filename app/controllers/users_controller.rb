class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user


  def show
    @user = current_user
    @nickname = "#{@user.nickname}さんのページ"
  end

  def edit
    @nickname = "#{@user.nickname}さんのページの編集"
  end

  def update
    @user.update(user_params)
    redirect_to users_mypage_path(@user)
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を完了いたしました。"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname,:is_active,:status,:email,:admin)
  end
end