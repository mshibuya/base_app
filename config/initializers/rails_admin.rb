# coding: utf-8

RailsAdmin::MainController.class_eval do
  jquery_sortable
end

ActsAsImageStore::RailsAdmin::Image

RailsAdmin.config do |config|
  config.model Prefecture do
    label '都道府県'
    list do
      items_per_page 500
      sort_by :position
      sort_reverse false
      field :position do
        label '並べ替え'
        formatted_value do
          #'<img src="/images/rails_admin/sortable_handle.png" class="handle" height="50%" />'.html_safe
          '<div class="handle"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span></div>'.html_safe
        end
        css_class 'position'
      end
    end
    field :id
    field :name
  end

  config.model ImageTest do
    field :name
    field :body
    field :image, :image
  end
end
