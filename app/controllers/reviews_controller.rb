class ReviewsController < ApplicationController
  before_action :set_book, only: [:new, :edit]
  before_action :set_review, only: [:show, :edit, :update]
  
  def new
    @car = Car.find(params[:car_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
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

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.book, notice: "レビューを登録しました。"
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :evaluation)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end