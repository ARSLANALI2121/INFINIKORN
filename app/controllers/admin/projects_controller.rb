module Admin
  class ProjectsController < BaseController
    before_action :authenticate_user!, only: %i[edit destroy update]
    before_action :set_project, only: %i[show edit destroy update]

    def index
      @project = Project.all
    end

    def new
      @project = Project.new
    end

    def show; end

    def edit; end

    def create
      @project = Project.new(params_project)
      @project.user_id = current_user.id
      if @project.save
        flash[:notice] = 'Your Project is created successfully'
        redirect_to admin_projects_path
      else
        render 'new'
      end
    end
  
    def update
      if @project.update(params_project)
        flash[:notice] = 'Project Information is updated successfully'
        redirect_to admin_projects_path
      else
        render 'edit'
      end      
    end
  
    def destroy
      if @project.destroy
        flash[:notice] = 'Project is deleted successfully'
        redirect_to admin_projects_path
      else
        redirect_to @project
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
