class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :destroy]

  def new
    @items = []

    keyword = "%#{params[:keyword]}%"
    if keyword
      @items = Item.where("name like ? or detail like ?", keyword, keyword).order('updated_at DESC')
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @want_users = @item.want_users
    @user = User.find(@item.user_id)
  end
  
  def edit
    @item = Item.find_by(id: params[:id], user_id: current_user.id)
  end

  def update
    @item = Item.find_by(id: params[:id], user_id: current_user.id)

    if @item.update(item_params)
      flash[:success] = '商品 は正常に更新されました'
      redirect_to @item
    else
      flash.now[:danger] = '商品 は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:success] = '商品を削除しました。'
    redirect_to myitems_path
  end

  private

  def correct_user
    @item = Item.find_by(id: params[:id], user_id: current_user.id)
    unless @item
      redirect_to item_path(params[:id])
    end
  end

  def item_params
    params.require(:item).permit(:name, :detail)
  end
end