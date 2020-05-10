class WelcomeController < ApplicationController
    def root
        render(plain: 'hello world')
    end

    def home

    end

    def about
        render(plain: 'about page')
    end

    def contact_us
        
    end
    def process_contact
        
    end

    def admin_panel
        if current_user.is_admin?
            @products = Product.all
            @reviews = Review.all
            @users = User.all
            
            render :panel
        else
            flash[:warning] = "unauthorized"
            redirect_to products_path
        end
    end

end
