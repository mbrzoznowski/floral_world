class OrdersController < ApplicationController
  attr_accessor :create, :new
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    if @order.save
      flash[:notice] = 'Dodano nowy produkt'
      redirect_to edit_product_path(Order.where("product_id = ?", (1)))
    else
      flash.now[:error] = 'Dodanie produktu nie powiodło się'
      redirect_to edit_product_path(Order.where("product_id = ?", (1)))
      # (Order.where(product_id: (params[:id])))
      # (Order.where(product_id: (params[:product_id])))
      # (Product.find(params[:id]))
    end
  end
end
