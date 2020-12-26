class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    # 商品が既に購入されている時は、トップページに遷移させる
    if Order.find_by(item_id:@item.id).nil?
      # 出品者がindexアクションに遷移しようとした場合、トップページに遷移させる
      if current_user.id != @item.user_id
        @order_destination = OrderDestination.new
      else
        redirect_to root_path
      end
      # /出品者がindexアクションに遷移しようとした場合、トップページに遷移させる
    else
      redirect_to root_path
    end
    # /商品が既に購入されている時は、トップページに遷移させる
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    # 商品が既に購入されている時は、トップページに遷移させる
    if Order.find_by(item_id:@item.id).nil?
      # Payjpにトークンを送信
      if @order_destination.valid?
        payjp_charge
        @order_destination.save
        redirect_to root_path
      else
        render :index
      end
      # /Payjpにトークンを送信
    else
      redirect_to root_path
    end
    # /商品が既に購入されている時は、トップページに遷移させる
  end

  private
  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone).merge(token: params[:token], user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def payjp_charge
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
