module Manager
  class ProjectsController < BaseController
    before_action :set_client
    before_action :set_project, only: %i[show edit destroy update]

    def index
      @project = @client.projects
    end

    def new
      @project = @client.projects.new
    end

    def show; end

    def edit; end

    def create
      @project = @client.projects.new params_project
      if @project.save
        redirect_to manager_client_projects_path, notice: 'Your Project is created successfully'       
      else
        render :new
      end
    end
  
    def update
      if @project.update(params_project)
        redirect_to manager_projects_path, notice: 'Project Information is updated successfully'
      else
        render :edit
      end
    end
  
    def destroy
      if @project.destroy
        redirect_to manager_client_projects_path, notice: 'Project is deleted successfully'
      else
        redirect_to @project
      end
    end

    private

    def set_project
      @project = @client.projects.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    def params_project
      params.require(:project).permit(:name, :description)
    end

  end
end
