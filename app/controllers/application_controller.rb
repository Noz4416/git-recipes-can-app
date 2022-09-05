class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q
 

  def after_sign_in_path_for(resource)
    root_path
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
    @genres = Genre.all
  end



end
