module ApplicationHelper
  def full_title( page_title)
    base_title = "Snipper"
    if page_title.empty?
      base_title
    else
      "#{ base_title} | #{ page_title}"
    end
  
  end
  def correct_user
    @user = User.find( params[ :id])
    redirect_to( root)
  end
  def this_user?( user)
    user == current_user
  end
end
