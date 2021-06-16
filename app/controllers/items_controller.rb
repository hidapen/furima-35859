class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:/, :new, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @items = Item.find(params[:id])
    unless @items.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:image,:title,:description,:category_id,:item_status_id,:delivery_charge_id,:prefecture_id,:delivery_date_id,:cost).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
        redirect_to new_user_session_path
    end
  end

end
