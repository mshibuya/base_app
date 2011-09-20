class ImageTest < ActiveRecord::Base
  has_image

  belongs_to :prefecture

  def color_enum
    [['White','Black'],'Black']
  end
end
