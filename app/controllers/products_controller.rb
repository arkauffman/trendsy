class ProductsController < ApplicationController
    def index
        if Product.find_by(params[:user]).nil?
            redirect_to root_path
            flash[:notice] = "You have no products!"
        else 
            @products = Product.find(params[:user]).all
        end
    end

    def new
        @product = Product.new
        user = User.find_by(id: params[:id])
    end

    def create
        user = User.find_by(id: params[:id])

        if user 
            session[:user_id] = user.id
            @product = Product.new(product_params)
        end
        # @user_id = User.find_by(params[:id])

        #@product.user_id = @user.id
        # @user = @product.user :include => [:user_id]
        # @product = Product.new(product_params)
        # @user = Product.User.find(params[:user_id])
    
        if @product.save
            flash[:notice] = "You have successfully added a product!"
            redirect_to root_path
        else 
            render :new
        end
    end


    private
    def product_params 
        params.require(:products).permit(:id, @user.id, :title, :price, :quantity, :description, :image)
    end

    # def show
    #     @products = User.find(params[:id])
    # end
end