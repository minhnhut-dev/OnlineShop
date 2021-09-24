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
        binding.pry
        
    end

    private
    def product_params
        params.permit(:name, :price, :active, :image_product, :category_id)
    end
end
