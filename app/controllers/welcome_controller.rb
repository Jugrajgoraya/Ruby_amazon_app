class WelcomeController < ApplicationController
    def root
        render(plain: 'hello world')
    end

    def home
        render(plain: 'home page')
    end

    def about
        render(plain: 'about page')
    end

    def contact_us
        
    end
    def process_contact
        
    end

end
