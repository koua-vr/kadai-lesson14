class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def read(result)
    id = result['id']
    name = result['name']
    detail = result['detail']
    user_id = @current_user['id']

    {
      id: id,
      name: name,
      detail: detail,
      user_id: user_id,
    }
  end
  
  def counts(user)
    @count_followings = user.followings.count
  end
end
