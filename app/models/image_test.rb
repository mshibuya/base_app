class ImageTest < ActiveRecord::Base
  has_image

  rails_admin do
    field :name
    field :body, :emoji_text
    field :image, :image
  end
end
