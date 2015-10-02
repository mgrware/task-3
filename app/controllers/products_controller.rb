class ProductsController < ApplicationController
  respond_to do |format|
  format.html do
  render :partial => "/shared/navigation_bar"
  end
end
  def index
  	 @products = Product.all


  end

  def new
  @product = Product.new
  end

def create
  @product = Product.new(product_params)
  if @product.save

        flash[:notice] = "Success Add Records"

        redirect_to action: 'index'

    else

        flash[:error] = "data not valid"

        render 'new'

end

end

def edit

        @product = Product.find_by_id(params[:id])

    end

   def update
 @product = Product.find_by_id(params[:id])

 if @product.update(product_params)

    flash[:notice] = "Success Update Records"

    redirect_to action: 'index'

 else

    flash[:error] = "data not valid"

    render 'edit'

 end

end

   def show
   	@products = Product.all
        @product = Product.find_by_id(params[:id])

    end

  def destroy

    @product = Product.find_by_id(params[:id])

    if @product.destroy

        flash[:notice] = "Success Delete a Records"

        redirect_to action: 'index'

    else

        flash[:error] = "fails delete a records"

        redirect_to action: 'index'

    end

end
private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def product_params
  params.require(:product).permit(:title, :content, :image)
end

end
