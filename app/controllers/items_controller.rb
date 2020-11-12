class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  private
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
end
