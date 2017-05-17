class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit show destroy update]

  def index
    @products = Product.all
  end

  def show
    @last_updated = @product.updated_at.strftime("%Y-%m-%d %H:%M")

  end


  def new
    @product = Product.new
    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Dodano nowy produkt'
      redirect_to edit_product_path(@product)
    else
      flash.now[:error] = 'Dodanie produktu nie powiodło się'
      render :new
    end
  end

  def edit
    @materials = Material.all
    opis = []
    # @product.materials.each do |x|
    #   opis << x.name
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Zmodyfikowano produkt'
       redirect_to edit_product_path(@product)
    else
      flash.now[:error] = 'Nie udało się zapisać'
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Usunięto rekord '#{@product.name}'"
    redirect_to products_path
  end


protected

  def set_product
    @product = Product.find(params[:id])
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price, :material_ids)
  end

end