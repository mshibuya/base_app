ActsAsImageStore::RailsAdmin::Image

RailsAdmin.config do |config|
  config.model ImageTest do
    field :name
    field :body
    field :image, :image
  end
end
