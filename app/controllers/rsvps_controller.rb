class RsvpsController < ApplicationController
  def create
    @rsvp = current_user.rsvps.build(event_id: params[:event_id])
    @event = Event.find(@rsvp.event_id)

    if @rsvp.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    redirect_back_or_to event_path, status: :see_other
    flash[:notice] = "You're no longer attending this event."
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:attendee_id, :event_id)
  end
end
