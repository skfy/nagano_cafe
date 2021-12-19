class OrdersController < ApplicationController

  def new
    @addresses = current_customer.addresses
    @order = Order.new
  end

  def show

  end

  def confirm
    @order = current_customer.orders.new
    if params[:order][:address_option] == "0"
      @order.address = current_customer.address# form_with で @order で送っているので、order に紐付いた address_option
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      shipment_address = Address.find(params[:order][:address_id])
      @order.postal_code = shipment_address.postal_code
      @order.address = shipment_address.address
      @order.name = shipment_address.name

    elsif params[:order][:address_option] == "2"
      @address = Address.new() #変数の初期化
      @address.address = params[:order][:address] #newページで新しいお届け先に入力した住所を取得代入
      @address.name = params[:order][:name] #newページで新しいお届け先に入力した宛名を取得代入
      @address.postal_code = params[:order][:postal_code] #newページで新しいお届け先に入力した郵便番号を取得代入
      @address.customer_id = current_customer.id #newページで新しいお届け先に入力したuser_idを取得代入
      if @address.save #保存
       @order.postal_code = @address.postal_code #上記で代入された郵便番号をorderに代入
       @order.name = @address.name #上記で代入された宛名をorderに代入
       @order.address = @address.address #上記で代入された住所をorderに代入
      end
    end
    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_customer.cart_items

  end

  def create
    @order = Order.new(order_params)

    @order.save

    redirect_to orders_complete_path

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method, :status)
  end

end
