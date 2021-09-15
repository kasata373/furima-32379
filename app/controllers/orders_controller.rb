class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index, only:[:index, :create]        

  def index
    @order = General.new 
  end

  def create
    @order = General.new(general_params) 
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def general_params
    params.require(:general).permit(:postal_code, :prefecture_id, :municipal_district, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: general_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end

end
