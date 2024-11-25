class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_allowed, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      return redirect_to '/'
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
  params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_owner
    if @item.user == current_user
      redirect_to '/'
    end
  end

  def redirect_if_not_allowed
    if @item.user == current_user || @item.order.present?
      redirect_to '/'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
      )
  end
end
