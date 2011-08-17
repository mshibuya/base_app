# coding: utf-8

RailsAdmin::MainController.class_eval do
  jquery_sortable
end

ActsAsImageStore::RailsAdmin::Image

RailsAdmin.config do |config|
end
