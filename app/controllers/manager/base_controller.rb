module Manager
  class BaseController < ApplicationController
    before_action :validate_manager

    def validate_manager
      return redirect_to root_path unless current_user.admin? || current_user.manager?
    end
    
  end
end 
