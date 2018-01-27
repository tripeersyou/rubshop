class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy, :update]
  def index
    @products = Product.all.where(seller_id: current_seller.id)
  end
  def new
    @product = current_seller.products.new
  end
  def create
    @product = current_seller.products.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end
  def show
    
  end
  def edit

  end
  def update
    picture = params[:product][:avatar]
    if @product.update(product_params)
      if picture
        @product.picture.attach(picture)
      end
      redirect_to @product
    else
      render :edit
    end
  end
  def destroy
    @product.delete
    redirect_to products_path
  end
  private
    def product_params
      params.require(:product).permit!
    end
    def set_product
      @product = Product.find(params[:id])
    end
end
