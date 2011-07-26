module RailsAdmin
  class UserController < RailsAdmin::ApplicationController
    before_filter :get_model
    jquery_sortable

    def jquery_sortable_model
      @abstract_model.model
    end

    def jquery_sortable_config
      { :column => 'position',
        :param => @abstract_model.model.name.downcase }
    end
  end
end

