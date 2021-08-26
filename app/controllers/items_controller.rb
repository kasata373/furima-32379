class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
     @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end
  
  def edit
    @item = Item.find(params[:id])
  end

  # def update
  #   item = Item.find(params[:id]
  #   item.update(item_params)
  # end

  def show
  end


  private

   def item_params
     params.require(:item).permit(:name, :product, :category_id, :state_id, :postage_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
   end

end
