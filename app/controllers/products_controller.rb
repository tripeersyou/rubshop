class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :delete]
  def index
    @product = Product.all.where(seller_id: current_seller.id)
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
    picture = params[:post][:avatar]
    if @product.update(product_params)
      if picture
        @product.picture.attach(picture)
      end
      redirect_to @product
    else
      render :edit
    end
  end
  def delete
    @product.destroy
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
