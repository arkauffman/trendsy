class LineItemsController < ApplicationController
    def create
        current_user.cart.add_product(params[:product_id])
        redirect_to root_path
    end
end