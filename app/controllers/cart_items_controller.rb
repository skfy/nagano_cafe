class CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @cart_items = @customer.cart_items.find(params[:item_id])
    @cart_items.update(params[:item_id])
    redirect_to cart_items_path(@customer)
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path(@customer)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
