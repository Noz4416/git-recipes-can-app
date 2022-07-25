class Users::SessionsController < Devise::SessionsController
# お試しログインの記述
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'お試し機能でログインしました'
  end

end
