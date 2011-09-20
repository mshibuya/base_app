# coding: utf-8

RailsAdmin::MainController.class_eval do
  jquery_sortable
end

RailsAdmin::Engine.routes.append do
  controller "user" do
    post "/:model_name/reorder", :to => :reorder, :as => "reorder"
  end
end

RailsAdmin.config do |config|
  config.model ImageTest do
    field :name
    field :body, :emoji_text
    field :comment, :emoji_text
    field :image, :image
    field :prefecture_id
    field :color, :enum
  end

  config.model Prefecture do
    label '都道府県'
    list do
      items_per_page 500
      sort_by :position
      sort_reverse false
      field :position do
        label '並べ替え'
        formatted_value do
          '<div class="handle"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span></div>'.html_safe
        end
        css_class 'position'
      end
    end
    field :id
    field :name
  end

  config.model StoredImage do
    visible false
  end
end
