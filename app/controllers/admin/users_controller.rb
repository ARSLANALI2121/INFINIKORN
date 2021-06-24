module  Admin
  class UsersController < BaseController
    before_action :set_user, only: [:show, :edit, :destroy, :update]
    def index
      @user = User.all
    end

    def new
      @user = User.new
    end

    def create
      
      @user = User.new user_params
      if @user.save  
        flash[:notice] = 'User was successfully created'
        redirect_to admin_users_path
      else
        flash[:alert] = 'User was Not created'
        render 'new'
      end
    end

    def update
      if @user.update(user_params)
        flash[:notice]= 'User was successfully Updated'
        else
          flash[:alert]= 'Their is an Error is this information'
        end
        redirect_to admin_users_path
    end

    def destroy
      if @user.destroy
        flash[:notice] = 'User has been delelted from this list'
        else
          flash[:alert] = 'Cannot Delete this user please check your right'
        end
        redirect_to admin_users_path
    end

    def edit
    end

    def show
    end

    private

    def set_user
      
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :profile_image)
    end

  end
end
