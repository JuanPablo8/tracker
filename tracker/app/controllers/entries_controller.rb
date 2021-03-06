class EntriesController < ApplicationController

  def index
    @activities = Activity.all
    @entries = Entry.all
  end


  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @activity = Activity.find(params[:activity_id])
    # @active = (entries_params)
    # @id = (entries2_params)
  end

  def create
    @activity = Activity.find(params[:activity_id])

    @entry = @activity.entries.create(entry_params)

    # redirect_to activity_path(@activity)

    if @entry.save
      redirect_to activity_entries_url
    else
      render 'new'
    end

  end


  def destroy
    @activity = Activity.find(params[:activity_id])
    @entry = @activity.entries.find(params[:id])
    @entry.destroy

    redirect_to activity_entries_url
  end



   private
   def entry_params
     params.require(:entry).permit(:duration, :comments)
   end

end
