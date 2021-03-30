class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  include PicturesHelper
  before_action :ensure_correct_user_for_picture, only: [:edit, :update, :destroy]
  before_action :initial_value, only: [:index, :new, :edit]
  def index
    pictures = Picture.all
    @recommend_picture = pictures.sample(2)
  end
  def new
    if params[:back]
      @picture = current_user.pictures.new(picture_params)
    else
      @picture = current_user.pictures.new
    end
  end
  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to user_path(current_user.id)
      else
        render :new
      end
    end
  end
  def confirm
    @picture = current_user.pictures.new(picture_params)
    render :new if @picture.invalid?
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
    @picture.destroy
    redirect_to user_path(current_user.id)
  end
  private
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
