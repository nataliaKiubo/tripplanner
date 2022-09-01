require "open-uri"

class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy copy]
  before_action :authenticate_user!, only: :toggle_favorite


  # GET /trips or /trips.json
  def index
    @trips = policy_scope(Trip)

    # @trips = Trip.all
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
    @trip = Trip.find(params[:id])
    @user = current_user
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    @trip.stops.build
    @trip.stops.build
    @trip.stops.build
    authorize @trip
  end

  # GET /trips/1/edit
  def edit
    authorize @trip
  end


  # POST /trips or /trips.json
  def create
    # custom logic to set up main_image

    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip

    if !@trip.main_image.attached? && @trip.original_image_url
      puts "attaching image"
      @trip.main_image.attach(io: URI.open(@trip.original_image_url), filename: "")
    end

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
    @tripcopy.main_image.attach(@trip.main_image.blob)
    @trip.stops.each do |stop|
      @tripcopy.stops << Stop.new(address: stop.address)
    end
  end

  def toggle_favorite
    @trip = Trip.find(params[:id])
    current_user.favorited?(@trip) ? current_user.unfavorite(@trip) : current_user.favorite(@trip)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = Trip.find(params[:id])
  end

    # Only allow a list of trusted parameters through.

    def trip_params
      params.require(:trip).permit(:name, :description, :categories, :amount_of_travellers, :amount_of_children, :pets, :original_trip_id, :user_id, :original_image_url, :main_image, gallery_images: [],
        stops_attributes: [:id, :date, :name, :address, :description, :_destroy])
    end
end
