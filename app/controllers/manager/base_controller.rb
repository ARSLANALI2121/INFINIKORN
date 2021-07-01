module Manager
  class BaseController < ApplicationController
    before_action :restrict_non_manager_and_admin

    def restrict_non_manager_and_admin
      return redirect_to root_path unless current_user.admin? || current_user.manager?
    end
    
  end
end 
