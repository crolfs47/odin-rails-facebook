class RsvpsController < ApplicationController
  def create
    @rsvp = current_user.rsvps.build(event_id: params[:event_id])
    @event = Event.find(@rsvp.event_id)

    if current_user.attended_events.where(id: @event.id).present?
      flash[:notice] = "You're already attending this event."
      redirect_to @event
    elsif @rsvp.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:attendee_id, :event_id)
  end
end
