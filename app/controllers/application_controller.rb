class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    redirect_to new_session_path unless current_user
  end
  def forbid_login_user
    if current_user
      redirect_to pictures_path
    end
  end
  def initial_value
    @init = "#{current_user.name}さん、その気持ち、シェアしよう"
  end
end
