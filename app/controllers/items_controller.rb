class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:title,:description,:category_id,:item_status_id,:delivery_charge_id,:prefecture_id,:delivery_date_id,:cost,:user,:text,:image)
  end

end