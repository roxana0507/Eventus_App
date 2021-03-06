class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]
  before_action :set_event, only: %i[ new edit update destroy]
  # GET /menus or /menus.json
  def index
    @menus = Menu.all
    @events = Event.find(params[:event_id])
  end

  # GET /menus/1 or /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    @event = Event.find(params[:event_id])

  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        format.html { redirect_to host_event_menu_path(current_host.id, @menu.event.id, @menu.id), notice: "Menu was successfully created." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        #format.html { redirect_to host_event_menus_path(current_host.id, @menu.event.id, @menu.id), notice: "Menu was successfully updated." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to host_event_menus_path(current_host.id, @menu.event.id), notice: "Menu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def set_event
     
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:name, :description, :image, :event_id)
    end
end
