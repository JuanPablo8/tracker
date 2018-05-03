class ActivitiesController < ApplicationController

  #http_basic_authenticate_with name: "tracker", password: "1234", except: [:index, :show]

#index shows all activities
  def index
    @activities = Activity.all
  end

#creates new instance of activity
  def new
    @activity = Activity.new
  end

  #finds specific activity using activity_id
  def show
    @activity = Activity.find(params[:id])
  end

#create method for new activity
  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity
    else
      render 'new'
    end

  end

  #destroy method for deleting activities
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    redirect_to activities_path
  end

  #method for required params in new activity
  private
  def activity_params
    params.require(:activity).permit(:title, :duration)
  end

end
