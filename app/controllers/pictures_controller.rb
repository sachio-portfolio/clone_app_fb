class PicturesController < ApplicationController
  include PicturesHelper
  before_action :select_picture, only: [:edit, :update, :destroy]
  def index
    @pictures = Picture.all
    @recommend = random_recommend(@pictures)
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @picture.update(picture_params)
      redirect_to picture_path
    else
      render :edit
    end
  end
  def destroy
  end
  private
  def picture_params
    params.require(:picture).permit(:content, :image, :user_id)
  end
  def select_picture
    @picture = Picture.find_by(params[:id])
  end
end
