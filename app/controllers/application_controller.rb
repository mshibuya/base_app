# coding: utf-8

require "./lib/jquery_sortable"

class ApplicationController < ActionController::Base
  protect_from_forgery :secret => '30979744578fc7569652c51a4e91437152a4e811e2de58c8202b86eef1672310a7a983712ec1ddcab2c5e1bbb000c29a07316a7fcd4e02b2c3dc1d335cf3c6af'

  include JquerySortable::ApplicationController

  before_filter :redirect_if_mobile
  before_filter :route_action_for_mobile

  layout :layout_type

  trans_sid
  docomo_guid

  private
  def redirect_if_mobile
    return if request_subdomain_type
    if request.mobile?
      redirect_subdomain_to "m"
    elsif request.smart_phone?
      redirect_subdomain_to "s"
    end
  end

  def redirect_subdomain_to(subdomain)
    base_domain = request.host_with_port.split('.')
    base_domain.shift if base_domain.first == 'www'
    redirect_to request.protocol + [subdomain, base_domain].compact.join('.') + request.request_uri
  end

  def route_action_for_mobile
    unless t = request_subdomain_type
      return
    end
    if respond_to?("#{@_action_name}_#{t.to_s}")
      @_action_name = "#{@_action_name}_#{t.to_s}"
    end
  end

  def layout_type
    if t = request_subdomain_type
      "application_#{t.to_s}"
    else
      "application"
    end
  end

  def request_subdomain_type
    case request.subdomain.split('.').first
    when 'm'
      :mobile
    when 's'
      :smart
    else
      nil
    end
  end
end
