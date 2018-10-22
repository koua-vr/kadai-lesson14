class CommunitiesController < ApplicationController
  before_action :require_user_logged_in, only: [:show]

  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @micropost = current_user.microposts.build
    @microposts = @community.microposts.order('created_at DESC')
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)

    if @community.save
      flash[:success] = 'コミュニティを登録しました。'
      redirect_to communities_path
    else
      flash.now[:danger] = 'コミュニティの登録に失敗しました。'
      render :new
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :detail)
  end
end
