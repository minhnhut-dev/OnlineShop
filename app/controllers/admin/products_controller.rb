class Admin::ProductsController < Admin::AdminController
    def index
        @products = Product.includes(:category, image_attachment: :blob).paginate(:page => params[:page], per_page: 5)
        @categories= Category.all
    end
    def create
    @product = Product.new(product_params)
        if @product.save
            redirect_to admin_products_path, notice: 'Product was successfully created'
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
        redirect_to admin_products_path , notice: 'Product was successfully update'
    end

    def destroy
       @product = Product.find(params[:id])
       @product.destroy
       redirect_to admin_products_path , notice: 'Product was successfully delete'
    end

    def delete_multiple
        if params[:product_ids] != nil
            @products = Product.where(id: params[:product_ids])
            @products = Product.delete(@products)
            redirect_to admin_products_path
        else
            redirect_to admin_products_path
        end
    end
    
    private
    def product_params
        params.permit(:name, :price, :active, :image, :category_id)
    end
end
