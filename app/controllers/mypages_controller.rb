class MypagesController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @items = @user.want_items
    @count_want = @user.want_items.count
    @followings = @user.followings
    counts(@user)
  end

  def new
  end

  def create
    @item = Item.new(name: params[:mypage][:name], detail: params[:mypage][:detail], user_id: current_user.id)

    if @item.save
      flash[:success] = '商品を登録しました。'
      redirect_to @item
    else
      flash.now[:danger] = '商品の登録に失敗しました。'
      render :new
    end
  end
  
end
