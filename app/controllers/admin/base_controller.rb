module Admin 
  class BaseController < ApplicationController
    before_action :validate_admin
    
    def validate_admin
      return redirect_to root_path unless current_user
    end
  end
end
