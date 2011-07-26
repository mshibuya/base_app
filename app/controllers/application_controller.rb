# coding: utf-8

require "./lib/jquery_sortable"

class ApplicationController < ActionController::Base
  protect_from_forgery

  include JquerySortable::ApplicationController
end
