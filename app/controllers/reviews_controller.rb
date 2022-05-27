class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    @review.booking = @booking
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = params[:booking_id]
    @review.save
    respond_to do |format|
      if @review.save
        format.html { redirect_to dashboard_path }
        format.json
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json
      end
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
