class ReviewsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]

    before_action :authorize!, only: [:edit, :update, :destroy]

    def create 
        @product = Product.find(params.require(:product_id))
        @review = Review.new review_params

        @review.user = current_user
        @review.product = @product
        if @review.save 
            
            redirect_to product_path(@product)
        else
            #for the list of reviews
            @reviews = @product.reviews.order(created_at: :DESC)
            render 'products/show'
        end
    end

    def destroy
        review = Review.find(params[:id])
        if can?(:crud, review )
            review.destroy
            redirect_to product_path(review.product)
        else
            head :unauthorized
        end
    end

    private

    def review_params 
        params.require(:review).permit(:body, :rating)
    end

    def authorize!
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, Review)
    end

end
