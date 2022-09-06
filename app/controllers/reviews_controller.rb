class ReviewsController < ApplicationController


  def create
    @trip = Trip.find(params[:trip_id])
    @review = Review.new(review_params)
    authorize @review
    @review.trip = @trip
    @review.user = current_user

    if @review.save
      redirect_to trip_path(@trip), notice: "Your review was created"
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
