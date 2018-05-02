class ActivitiesController < ApplicationController
  def new

  end

  def create
    @activity = Activity.new(activity_params)

    @activity.save
    redirect_to @activity
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :duration)
  end

end
