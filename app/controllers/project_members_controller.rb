class ProjectMembersController < ApplicationController
  before_action :set_project

  def index
    @members = @project.users
  end

  def add_member
    user = User.find(params[:id])
    @project.users << user unless @project.users.include?(user)
    redirect_to @project, notice: "Member added."
  end

  def remove_member
    user = User.find(params[:id])
    @project.users.delete(user)
    redirect_to @project, notice: "Member removed."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
