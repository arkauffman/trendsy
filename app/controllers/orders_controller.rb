class OrdersController < ApplicationController
    # def index
    #     @line_items = @order.line_items
    #     @line_items.all
    # end

    def show
        @order = Order.find(params[:id])
        # able to say
        @line_items = @order.line_items

    end

end