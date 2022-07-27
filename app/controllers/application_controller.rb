class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q
  before_action :set_genre


  def after_sign_in_path_for(resource)
    users_mypage_path
  end

  def after_sign_out_path_for(resouce)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

  def set_q
    @q = Recipe.ransack(params[:q])
  end

  def set_genre
    @d = Genre.ransack(params[:q])
    @genre_name = Genre.select("name").distinct
  end

end
