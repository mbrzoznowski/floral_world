class OrdersController < ApplicationController
  attr_accessor :create, :new
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = 'Dodano nowe kwiaty'
      puts @order.product_id
      redirect_to edit_product_path(@order.product_id)
    else
      flash[:error] = 'Dodanie kwiatów nie powiodło się'
      redirect_to edit_product_path(@order.product_id)

      # (Order.where(product_id: (params[:id])))
      # (Order.where(product_id: (params[:product_id])))
      # (Product.find(params[:id]))
    end
  end


private

  def order_params
    params.require(:order).permit(:product_id, :material_id, :amount)
  end

end
