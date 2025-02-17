class ProjectFeedsController < ApplicationController
  before_action :set_project

  def create
    @feed = @project.project_feeds.new(feed_params.merge(user: current_user))
    
    if @feed.save
      respond_to do |format|
        format.html { redirect_to @project, notice: "Comment added." }
        format.turbo_stream
      end
    else
      flash[:alert] = "Failed to add comment."
      redirect_to @project
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def feed_params
    params.require(:project_feed).permit(:message)
  end
end
