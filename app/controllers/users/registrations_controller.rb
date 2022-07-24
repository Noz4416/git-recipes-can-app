class Users::RegistrationsController < Devise::RegistrationsController

# お試し機能中にユーザーの編集・削除を不可にする
  before_action :check_guest, only: :destroy

  def chrck_guest
    if resouce.email == 'guest@example.com'
      redirect_to root_path, alert: 'お試し機能中はユーザーの削除はできません'
    end
  end

end
