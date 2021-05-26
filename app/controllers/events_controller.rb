class EventsController < ApplicationController
  before_action :set_host, except: %i[ index assign_guest  ] 
  before_action :set_event, only: %i[ assign_guest show edit update destroy ]
  before_action :authenticate_host!, except: :index

  # GET /events or /events.json
  def index 
    if host_signed_in? 
      @events = current_host.events
    elsif guest_signed_in?
      @events = current_guest.events
    else 
      @events = Event.all
    end
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        current_host.events.push(@event)
        format.html { redirect_to root_path, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to host_event_path(current_host.id, @event.id), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
      respond_to do |format|
        format.html { redirect_to host_events_path(current_host.id), notice: "host was successfully destroyed." }
        #host_event_menus GET    /hosts/:host_id/events/:event_id/menus(
        format.json { head :no_content }
      end
   end

   def assign_guest
    @guest = Guest.find_by(email: params[:guest_email])
    if @guest
        @event.guests.push(@guest)
        redirect_to host_event_path(current_host.id, @event.id), notice: "Se ha agregado un nuevo invitado"
    else
     redirect_to host_event_path(current_host.id, @event.id), notice: "No se ha encontrado el usuario"
    end
   end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_host
      @host = Host.find(params[:host_id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :kind, host_events_attributes: [:id, :event_id, :host_id])
    end
end
