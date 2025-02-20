class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:show, :edit, :update, :destroy]

  def index
    @owned_projects = current_user.owned_projects
    @participating_projects = current_user.projects.where.not(user_id: current_user.id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.owned_projects.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project successfully created."
    else
      flash[:alert] = "Failed to create project."
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      if @project.update(project_params.except(:status))
        
        if params[:project][:status].present? && params[:project][:status] != @project.current_state
          begin
            @project.state_machine.transition_to!(params[:project][:status])
          rescue Statesman::TransitionFailedError => e
            flash[:alert] = "Invalid status transition: #{e.message}"
            return redirect_to edit_project_path(@project)
          end
        end
  
        respond_to do |format|
          format.html { redirect_to @project, notice: "Project updated successfully." }
          format.turbo_stream
        end
      else
        flash[:alert] = "Failed to update project."
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Project deleted successfully."
      redirect_to projects_path
    else
      flash[:alert] = "Failed to delete project."
      redirect_to @project
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, user_ids: [])
  end

  def authorize_user!
    unless @project.user == current_user || @project.users.include?(current_user)
      flash[:alert] = "You do not have access to this project."
      redirect_to projects_path
    end
  end
end
