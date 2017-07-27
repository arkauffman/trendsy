class LineItemsController < ApplicationController
    def create
        current_user.cart.add_product(params[:product_id])
        redirect_to root_path
    end

    def update
        current_user.cart.add(params[:id])
        redirect_to order_path(current_user.cart)
    end

    def destroy
        current_user.cart.remove_product(params[:id])
        redirect_to order_path(current_user.cart)
    end

    def show
        redirect_to order_path(current_user.cart)
    end
end