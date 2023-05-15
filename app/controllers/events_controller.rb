class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    Rsvp.create(attendee_id: current_user.id, event_id: @event.id)
    
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
    flash[:notice] = "Event deleted."
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :start_time, :end_time, :details)
  end
end
