class Users::RegistrationsController < Devise::RegistrationsController

# お試し機能中にユーザーの編集・削除を不可にする
  before_action :ensure_nomal_user, only: %i[update destroy]

  def ensure_nomal_user
    if resouce.email == 'guest@example.com'
      redirect_to root_path, alert: 'お試し機能中はユーザーの更新・削除はできません'
    end
  end

end
