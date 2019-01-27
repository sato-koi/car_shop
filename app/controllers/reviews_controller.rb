class ReviewsController < ApplicationController
  def new
    @car = Car.find
    @review = Review.new
  end

  def create
    @review =Review.new(review_params)
    @review.attributes = {
      car_id: params[:car_id],
      user_id: current_user.id
    }
    if @review.save
      redirect_to @review.car, notice: "レビューを登録しました。"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :evaluation)
  end

end
