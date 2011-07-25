# coding: utf-8

ActsAsImageStore::RailsAdmin::Image

RailsAdmin.config do |config|
  config.model Prefecture do
    label '都道府県'
    field :name
    list do
      sort_by :position
      sort_reverse false
    end
  end

  config.model ImageTest do
    field :name
    field :body
    field :image, :image
  end
end
