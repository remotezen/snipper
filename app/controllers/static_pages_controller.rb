class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
    @micropost = current_user.microposts.build 
    @feed_items = current_user.feed.paginate( page: params[ :page])
    else
      redirect_to signin_path
    end 
  end

  def help
  end
  def about

  end
end
