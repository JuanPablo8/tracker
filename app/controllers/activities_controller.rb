class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity
    else
      render 'new'
    end

  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    redirect_to activities_path
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :duration)
  end

end
