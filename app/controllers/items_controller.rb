class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  # before_action :set_item, only: [:edit, :update, :show, :destroy]


  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def index
    @item = Item.all
    # @item = Item.order("created_at DESC")
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

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


  private

   def item_params
     params.require(:item).permit(:name, :product, :category_id, :state_id, :postage_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
   end

end
