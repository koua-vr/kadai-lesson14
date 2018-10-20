class MicropostsController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :correct_user, only: [:destroy]

  def show
    @community = Community.find(params[:id])
    @micropost = current_user.microposts.build
    @microposts = @community.microposts.order('created_at DESC')
  end

  def create
    @micropost = Micropost.new(content: params[:micropost][:content], user_id: current_user.id, community_id: params[:community_id])
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to micropost_path(params[:community_id])
    else
      @community = Community.find(params[:community_id])
      @microposts = @community.microposts.order('created_at DESC')
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'microposts/show'
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to micropost_path(params[:community_id])
    end
  end
end
