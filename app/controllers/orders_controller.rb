class OrdersController < ApplicationController

  def show
    @item = Item.find(params[:item_id])
    @order = @item.order.new
  end

  def confirm
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    @order.save
    redirect_to items_path
  end

  private
  def order_params
    params.require(:order)
    .permit(:amount,
            :quantity,
            :item_id)
  end

end
