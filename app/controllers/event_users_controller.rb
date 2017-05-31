class EventUsersController < ApplicationController
  before_action :authenticate

  def create
    @event = Event.find(params[:event_id].to_i)
    @event_user = EventUser.new(user_id: current_user.id, event_id: @event.id)
    byebug
    #fix needed
    if EventUser.where(user_id: current_user, event_id: @event.id)
      flash[:error] = "You cannot attend the same event twice"
    elsif @event_user.save
      flash[:notice] = "Looking forward to seeing you there!"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to event_path(@event)
  end


end
