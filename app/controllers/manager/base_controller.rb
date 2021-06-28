module Manager
  class BaseController < ApplicationController

    def validate_admin
      # return redirect_to root_path unless current_user.admin? && current_user.manager?
    end
  end

end 