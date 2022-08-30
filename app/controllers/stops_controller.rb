class StopsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy create ]

  # GET /trips or /trips.json
  def index
    @stops = Stop.all
  end

  # GET /trips/1 or /trips/1.json
  def show
    authorize @stop
  end

  # GET /trips/new
  def new
    @trip = Trip.find(params[:trip_id])
    @stop = Stop.new
    authorize @stop
  end

  # GET /trips/1/edit
  def edit
    authorize @stop
  end

  # POST /trips or /trips.json
  def create
    @stop = Stop.new(stop_params)
    @stop.trip = @trip
    authorize @stop

    respond_to do |format|
      if @stop.save
        format.html { redirect_to trip_url(@trip), notice: "Your stop was successfully created." }
        format.json { render :show, status: :created, location: @stop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    authorize @stop
    respond_to do |format|
      if @stop.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: "Your stop was successfully updated." }
        format.json { render :show, status: :ok, location: @stop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    authorize @stop
    @stop.destroy

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Your stop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
    @trip = Trip.find(params[:trip_id])
    end

    # Only allow a list of trusted parameters through.
    def stop_params
      params.require(:stop).permit(:date, :name, :address, :description, :trip_id)
    end
end
