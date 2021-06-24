module Admin
  class ProjectsController < BaseController
    before_action :authenticate_user!, only: [:edit, :destroy, :update]
    before_action :set_project, only: [:show, :edit, :destroy, :update]
    def index
      @project = Project.all
    end

    def new
      @project = Project.new
    end

    def show
    end

    def edit
    end

    def create
      @project = Project.new(params_project)
      @project.user_id = current_user.id
      if @project.save
        flash[:notice] = 'Your Project is created successfully'
        redirect_to admin_projects_path
      else
        flash[:alert] = 'Sorry this is an error in this information'
        render 'new'
      end
    end
  
    def update
      if @project.update(params_project)
        flash[:notice] = 'Project Information is updated successfully'
      else
        flash[:alert] = 'Their is some error is this information'
      end
      redirect_to admin_projects_path
    end
  
    def destroy
      if @project.destroy
        flash[:notice] = 'Project is deleted successfully'
        redirect_to admin_projects_path
      else
        flash[:alert] = 'Their is an Error'
      end
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def params_project
      params.require(:project).permit(:name, :description)
    end

  end
end
