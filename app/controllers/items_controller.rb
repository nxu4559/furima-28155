class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path, method: :get
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:price, :image, :name, :description, :category_id, :condition_id, :postage_prayer_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
