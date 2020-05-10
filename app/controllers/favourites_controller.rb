class FavouritesController < ApplicationController
    before_action :authenticate_user!

    def create
        product = Product.find params[:product_id]
        favourite = Favourite.new(user: current_user, product: product)
        if favourite.save
            flash[:success] = "added to favourite list"
            redirect_to product_path(product)
        else
            flash[:warning] = " could not add to favourite list"
            redirect_to product_path(product)
        end
    end

    def destroy
        favourite = Favourite.find params[:id]
        if favourite.destroy
            flash[:success] = "removed from favourites"
            redirect_to favourite.product
        else
            flash[:warning] = "could not remove from favourites"
            redirect_to favourite.product
        end
    end

    
end
