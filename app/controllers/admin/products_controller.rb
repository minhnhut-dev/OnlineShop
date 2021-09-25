class Admin::ProductsController < Admin::AdminController
    def index
        @products = Product.all
        @categories = Category.all
    end
    def create
       @product= Product.new(product_params)
        if @product.save
            redirect_to admin_products_path , notice: 'Product was successfully created'
        else
            redirect_to admin_products_path , notice: 'Error create product, please try again later'
        end
    end

    def show
        @product = Product.find(params[:id])
    end
    
    def update
       @product = Product.find(params[:id]) 
       @product.update(product_params)
       if @product.save
        redirect_to admin_products_path , notice: 'Product was successfully update'
       else
        redirect_to admin_products_path , notice: 'Product was error update'
        end
    end

    def delete
       @product = Product.delete(params[:id])
        redirect_to admin_products_path , notice: 'Product was successfully delete'
    end
    private
    def product_params
        params.permit(:name, :price, :active, :image, :category_id)
    end
end
