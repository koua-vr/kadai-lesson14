class MyitemsController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: current_user.id)
  end
end
