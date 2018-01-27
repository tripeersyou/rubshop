class OrdersController < ApplicationController
    before_action :set_seller, except: [:index, :order, :show]
    def index
        @orders = Order.all.where(buyer_id: current_buyer.id)
    end
    def show
        @order = Order.find(params[:id])
    end
    def new
        @order = current_buyer.orders.new
    end
    def create
        @order = current_buyer.orders.new(order_params)
        @order.seller_id = @seller.id
        @order.order_lines.each do |ol|
            product = ol.product
            product.quantity -= ol.quantity
            if product.quantity <= 0
                product.delete
            else
                product.save
            end
        end
        if @order.save
            redirect_to @order
        else
            render :new
        end
    end
    private
        def order_params
            params.require(:order).permit!
        end
        def set_seller
           @seller = Seller.find(params[:seller_id]) 
        end
end
