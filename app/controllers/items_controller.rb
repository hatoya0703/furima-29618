class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # 保存に失敗した時はnewアクションに遷移させる
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # 出品者以外がeditアクションに遷移しようとした場合、showアクションに遷移させる
    redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    # ログインユーザーと出品者が同一でなければshowアクションに遷移させる
    if current_user.id == @item.user_id
      # 更新に成功したらshowアクションにリダイレクト、失敗した時は編集画面へ遷移させる
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    else
      redirect_to item_path(@item.id)
    end
  end

  def destroy
    # ログインユーザーと出品者が同一でなければshowアクションに遷移させる
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_fee_bearer_id, :sender_area_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
