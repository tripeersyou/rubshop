class OrdersController < ApplicationController
    before_action :set_seller, except: [:index, :order]
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
