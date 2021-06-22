class ProjectsController < ApplicationController
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
      flash[:notice] = "Your Project is created successfully"
    else
      flash[:alert] = " Sorry this is an error in this information"
    end
    redirect_to projects_path
  end
 
  def update
    # byebug
    if @project.update(params_project)
      flash[:notice] = " Project Information is updated successfully...!"
    else
      flash[:error] = " Their is some error is this information"
    end
    redirect_to projects_path
  end
 
  def destroy
    # byebug
    if @project.destroy
      flash[:success]= "Project is deleted successfully...!"
      redirect_to projects_path
    else
      flash[:error]= "Their is an Error"
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
