class Admin::CategoryController < Admin::AdminController
  def index
    @categories = Category.all
  end
  
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_category_index_path , notice: 'Category was successfully created'
    else
      redirect_to admin_category_index_path , notice: 'Error create category, please try again late'
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_category_index_path , notice: 'Category was successfully update'
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_category_index_path , notice: 'Category was successfully delete'
  end
  
  private
  
  def category_params
    params.permit(:name, :active)
  end
end
