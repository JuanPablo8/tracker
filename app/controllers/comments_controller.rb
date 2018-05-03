class CommentsController < ApplicationController

  #authentication required to create new activity
  #http_basic_authenticate_with name: "tracker", password: "1234", only: :destroy

  def index
    render 'activities/show'
  end

  #method for creating comment and linking it to an activity_id
  def create
    @activity = Activity.find(params[:activity_id])
    @comment = @activity.comments.create(comment_params)
    redirect_to activity_path(@activity)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
