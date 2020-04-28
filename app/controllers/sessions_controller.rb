class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email params[:email]
        # user& is a little bit of meta-programming. This basically checks if user is NOT nil before trying to call .authenticate. This is to avoid no method errors.
        if user&.authenticate params[:password]
          session[:user_id] = user.id

          flash[:success] = "User Logged In"
          redirect_to products_path
        else
          flash[:warning] = "couldn't log in"
          render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to products_path
    end

end
