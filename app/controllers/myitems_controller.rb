class MyitemsController < ApplicationController
  before_action :require_user_logged_in, only: [:index]
  
  def index
    @user = current_user
    @items = Item.where(user_id: current_user.id)
  end
end
