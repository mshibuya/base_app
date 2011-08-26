class ImageTest < ActiveRecord::Base
  has_image

  belongs_to :prefecture

  rails_admin do
    field :name
    field :body, :emoji_text
    field :image, :image
    field :prefecture_id
    field :color, :enum
  end

  def color_enum
    [['White','Black'],'Black']
  end
end
