class OrdersController < ApplicationController
    before_action :authorize, only: [:index, :show, :checkout]

    def index
        @orders = current_user.orders.order(created_at: :desc)
    end
    
    def show
        @order = Order.find(params[:id])
        @line_items = @order.line_items
    end

    def checkout
        @order = Order.find(params[:id])
        @order.is_cart = false
        @order.save
        redirect_to orders_path
    end
end