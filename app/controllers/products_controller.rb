class ProductsController < ApplicationController
    before_action :authorize, except: [:index, :show, :home]

    def index
        if Product.where(user: current_user).count == 0
            flash[:notice] = "You have no products!"
            redirect_to profile_path(current_user)
        else 
            @products = Product.where(inactive: false, description: params[:filter])
            if params[:filter] && (params[:filter] != 'All') && (params[:filter] != 'Inactive')
                if @products.count == 0
                    flash[:notice] = "There are no products with that description!"
                else
                    flash[:notice] = ""
                    @products = Product.where(inactive: false, description: params[:filter])
                end
            elsif (params[:filter] == 'Inactive')
                @products = Product.where(inactive: true)
                if @products.count != 0
                    flash[:notice] = ""
                    @products = Product.where(inactive: true)
                else
                    flash[:notice] = "There are no inactive products!"
                end
            else 
                flash[:notice] = ""
                @products = Product.where(inactive: false, user: current_user)
            end
        end
    end

    def home 
        flash[:notice] = ""
        @products = Product.where(inactive: false, description: params[:filter])
        if params[:filter] && (params[:filter] != 'All')
            if @products.count == 0
                flash[:notice] = "There are no products with that description!"
            else
                flash[:notice] = ""
                @products = Product.where(inactive: false, description: params[:filter])
            end
        else
            flash[:notice] = ""
            @products = Product.where(inactive: false)
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def destroy
        @product = Product.find(params[:id])
        @product.inactive = true
        @product.save
        redirect_to products_path, notice: 'Product was marked inactive.'
    end

    def show
        @product = Product.find(params[:id])
        if @product.quantity == 0
            @product.inactive = true
            @product.save
        end
    end

    def update
        @product = Product.where(user: current_user).find(params[:id])
        if @product.update_attributes(product_params)
            if @product.quantity == 0
                flash[:notice] = "The quantity needs to be greater than 0!"
                render :edit
            else
                redirect_to products_path
            end
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

    def activate
        @product = Product.find(params[:id])
        @product.inactive = false
        @product.save
        redirect_to products_path
    end

    private
    def product_params 
        params.require(:product).permit(:title, :price, :quantity, :description, :image)
    end

end