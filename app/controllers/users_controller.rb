class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to pictures_path
    else
      render :new
    end
  end
  def show
    @sample_pic = current_user.pictures.where.not(image: nil).order("id DESC")
    @some_pic = @sample_pic.sample(3)
    @pictures = current_user.pictures.all
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
