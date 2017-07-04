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
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Usunięto #{@order.material.name} sztuk: #{@order.amount}"
    redirect_to edit_product_path(@order.product_id)
  end

private

  def order_params
    params.require(:order).permit(:product_id, :material_id, :amount)
  end

end
