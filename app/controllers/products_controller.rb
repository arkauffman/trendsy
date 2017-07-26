class ProductsController < ApplicationController
    before_action :authorize, except: [:index, :show, :home]

    def index
        if Product.find_by(params[:user]).nil?
            redirect_to root_path
            flash[:notice] = "You have no products!"
        else 
            @products = Product.where(user: current_user)
        end
    end

    def home 
        @products = Product.all
    end

    def edit
        @product = Product.find(params[:id])
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to profile_path(current_user), notice: 'Product was successfully deleted.'
    end

    def show
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.where(user: current_user).find(params[:id])

        if @product.update_attributes(product_params)
            redirect_to products_path
        else
            render :edit
        end
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.user = current_user
    
        if @product.save
            flash[:notice] = "You have successfully added a product!"
            redirect_to root_path
        else 
            render :new
        end
    end

    private
    def product_params 
        params.require(:product).permit(:title, :price, :quantity, :description, :image)
    end

end