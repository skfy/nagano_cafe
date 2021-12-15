class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @items = @order.order_details
  end
end
