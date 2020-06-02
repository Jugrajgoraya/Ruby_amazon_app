class Api::V1::ProductsController < Api::ApplicationController
    def index
      products = Product.order(created_at: :desc)
      render(json: products, each_serializer: ProductCollectionSerializer)
    end
  
    def show
      product = Product.find(params[:id])
      render(json: product, include: [:author, {answers: [:author]}])
    end
  
    # no need for new
    # def new
    # end
  
    def create
      product = Product.new params.require(:product).permit(:title, :description, :price, :tag_names)
      product.user = current_user
      if product.save
        render(json: { id: product.id })
      else
        render(
          json: { errors: product.errors },
          status: 422 # unprocessable entity HTTP Status Code
        )
      end
    end
    
    # No need for edit
    # def edit
    # end
  
    def delete
    end
  end
  