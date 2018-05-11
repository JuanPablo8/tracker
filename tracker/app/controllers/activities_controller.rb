class ActivitiesController < ApplicationController

  http_basic_authenticate_with name: "tracker", password: "1234", except: [:index, :show]

#index shows all activities
  def index
    @activities = Activity.all
  end

#creates new instance of activity
  def new
    @activity = Activity.new
  end

  def edit
    @activity = Activity.find(params[:id])
  end


  #finds specific activity using activity_id
  def show
    @activity = Activity.find(params[:id])
    # @entry = @activity.entries.find (params[:id])

  end

#create method for new activity
  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to activities_path
    else
      render 'new'
    end

  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      redirect_to activities_path
    else
      render 'edit'
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
    params.require(:activity).permit(:title)
  end

end
