class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    admin_user_path(current_user)
  end

end
