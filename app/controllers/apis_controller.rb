class ApisController < ApplicationController
    def products
        @product = Product.where(id: params[:id]).first
        if @product.presence == nil
            error = {error: '404'}
            render json: error
        else
            render json: @product
        end
    end
end
