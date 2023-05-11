class RsvpsController < ApplicationController
  def create
    @rsvp = current_user.rsvps.build(event_id: params[:event_id])
    @event = Event.find(@rsvp.event_id)

    if current_user.attending_event?(@event)
      flash[:notice] = "You're already attending this event."
      redirect_to @event
    elsif @rsvp.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    redirect_to event_path
    flash[:notice] = "You're no longer attending this event."
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:attendee_id, :event_id)
  end
end
