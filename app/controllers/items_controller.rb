class ItemsController < ApplicationController
  before_action :require_user_logged_in

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
  
end