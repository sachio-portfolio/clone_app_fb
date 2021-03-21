module PicturesHelper
  def random_recommend(pictures)
    max_num = pictures.size
    number = rand(0..max_num)
    recommend_picture = Picture.find_by(id: number)
    recommend_picture
  end
end
