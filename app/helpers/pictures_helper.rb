module PicturesHelper
  def new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_pictures_path
    elsif action_name == 'edit'
      picture_path
    end
  end
  def ensure_correct_user_for_picture
    picture = Picture.find(params[:id])
    if current_user.id != picture.user_id.to_i
      redirect_to pictures_path
    end
  end
end
