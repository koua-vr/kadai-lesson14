class CommunitiesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)

    if @community.save
      flash[:success] = 'コミュニティを登録しました。'
      redirect_to @community
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
