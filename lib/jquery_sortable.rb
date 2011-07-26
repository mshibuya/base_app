# coding: utf-8

##
# == 概要
# jQueryによるAjax並び替えの共通処理を実装。
#
module JquerySortable
  #
  # ApplicationControllerにextendするモジュール
  #
  module ApplicationController
    extend ActiveSupport::Concern

    included do
      helper do
        include JquerySortable::HelperMethods
      end
    end

    module ClassMethods
      def jquery_sortable(options = {})

        controller_name = self.name.sub("Controller","")
        configuration = { :column     => "position", 
          :controller => controller_name, 
          :model      => controller_name.singularize, 
          :param      => controller_name.singularize.underscore }
        configuration.update(options) if options.is_a?(Hash)

        class_eval <<-EOV
        include JquerySortable::InstanceMethods

        def jquery_sortable_class
          ::#{self.name}
        end

        def jquery_sortable_model
          ::#{configuration[:model]}
        end

        def jquery_sortable_config
          #{configuration.to_s}
        end

        helper do
          def jquery_sortable_config
          #{configuration.to_s}
          end

        end
          EOV
      end
    end
  end

  #
  # 各コントローラにincludeされるモジュール
  #
  module InstanceMethods
    def reorder
      if params[jquery_sortable_config[:param]].is_a?(Array)
        jquery_sortable_model.transaction do
          params[jquery_sortable_config[:param]].each_with_index do |id, pos|
            item = jquery_sortable_model.find(id) rescue next
            item[jquery_sortable_config[:column]] = pos + 1
            item.save
          end
        end
      end
      render :nothing => true
    end
  end

  #
  # 各コントローラにヘルパーとしてincludeされるモジュール
  #
  module HelperMethods
    def sortable_element(element_id, options = {})
      javascript_tag(sortable_element_js(element_id, options).chop!)
    end

    def sortable_element_js(element_id, options = {}) #:nodoc:
      options = options.symbolize_keys
      # option for ajax
      options[:type]      ||= "post"
      options[:data_type] ||= "script"
      options[:url]       ||= url_for(:action => 'reorder')
      options[:data]      ||= "$('##{element_id}').sortable('serialize')"
      options[:complete]  ||= "function(request){$('##{element_id}').effect('highlight');}"
      #option for sortable
      options[:items]     ||= "tr"
      options[:opacity]   ||= 0.4

      [:type, :data_type, :url, :cursor, :handle, :items].each do |option|
        options[option] = "'#{options[option]}'" if options[option]
      end
      remote_options = {}
      [:type, :data_type, :url, :data, :complete].each do |option|
        if options[option]
          remote_options[option] = options[option] if options[option]
          options.delete(option)
        end
      end
      if !options.key?(:update) || options[:update]
        options[:update] ||= "function(){$.ajax(#{options_for_javascript(remote_options)});}"
      else
        options.delete(:update)
      end

      "$j(document).ready(function($){$('##{element_id}').sortable( #{options_for_javascript(options)});});"
    end

  end
end
