module  Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[show edit destroy update toggle_activation]

    def index
      @user = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params
      if @user.save
        redirect_to admin_users_path, notice: 'User was successfully created'
      else
        render :new
      end
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully Updated'
      else
        render :edit
      end
    end

    def destroy
      if @user.destroy
        redirect_to admin_users_path, notice: 'User has been delelted from this list'
        else
          redirect_to @user
        end
    end

    def edit; end

    def show; end

    def toggle_activation
      @user.update_attribute(:is_active, !@user.is_active)
      redirect_to admin_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :profile_image, :role)
    end

  end
end
