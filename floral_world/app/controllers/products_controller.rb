class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit show]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash.now[:notice] = 'Dodano nowy produkt'
      redirect_to products_path
    else
      flash[:error] = 'Dodanie produktu nie powiodło się'
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Zmodyfikowano produkt'
    else
      flash[:error] = 'Nie udało się zapisać'
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Usunięto rekord #{@product.id}: #{@product.name}"
  end


protected

  def set_product
    @product = Product.find(params[:id])
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end