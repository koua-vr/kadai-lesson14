class OwnershipsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])

    # Want 関係として保存
    if params[:type] == 'Want'
      current_user.want(@item)
      flash[:success] = '商品を Want しました。'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])

    if params[:type] == 'Want'
      current_user.unwant(@item) 
      flash[:success] = '商品の Want を解除しました。'
    end

    redirect_back(fallback_location: root_path)
  end
end
