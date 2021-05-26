class GuestsController < ApplicationController
    def index
        @event = Event.find(params[:event_id])
        @guests = @event.guest
        @guests = Guest.group_by_day(:created_at).count
    end

    def show
        @guest = Guest.find(params[:id])
    end
end
