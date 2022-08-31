class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy copy]

  # GET /trips or /trips.json
  def index
    @trips = policy_scope(Trip)
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  def show
    authorize @trip
    @stops = @trip.stops.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @trip.stops.geocoded.map do |stop|
      {
        lat: stop.latitude,
        lng: stop.longitude
      }
    end
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    authorize @trip
  end

  # GET /trips/1/edit
  def edit
    authorize @trip
  end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    authorize @trip
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    authorize @trip
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def copy
    authorize @trip

    @tripcopy = Trip.new(name: @trip.name, description: @trip.description, categories: @trip.categories, amount_of_travellers: @trip.amount_of_travellers, amount_of_children: @trip.amount_of_children, pets: @trip.pets, original_trip_id: @trip.id)

    @trip.stops.each do |stop|
      @tripcopy.stops << Stop.new(address: stop.address)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:name, :description, :categories, :amount_of_travellers, :amount_of_children, :pets, :original_trip_id, :user_id, :main_image, gallery_images: [])
    end
end
