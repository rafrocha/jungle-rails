class ReviewsController < ApplicationController

  def create
    current_user = User.find(session[:user_id]) if session[:user_id]
    product = Product.find params[:product_id]
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = product.id
    # @review.product_id =
    if @review.valid?
      @review.save
    end
      redirect_to product
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])
  end

  private
    def review_params
      params[:product].require(:reviews).permit(
        :description,
        :rating,
      )
    end
end
