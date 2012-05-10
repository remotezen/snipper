class UsersController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :correct_user, only: [ :edit,  :update]
  def index
    @users = User.paginate( page: params[ :page])
  end
  def show
    @user = User.find( params[ :id])
    @microposts = @user.microposts.paginate( page: params[ :page])
  end 
  def destroy
    
    User.find( params[ :id]).destroy
    flash[ :success] = "User destroyed"
    redirect_to users_index_path
  end
  def signed_in_user
    unless user_signed_in?
      store_location  
      redirect_to signin_path, notice: "Please sign in."
    end

  end
end
