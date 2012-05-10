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
  def current_user?( user)
    current_user == user
  end
  def this_user?( user)
    user == current_user
  end
  def signed_in_user
    unless user_signed_in?
      redirect_to signin_path, notice: "...please sign in."
    end
  end
  def redirect_back_or(default)
    redirect_to( session[ :return_to] || default)
    clear_return_to
  end 
  def store_location
    session[ :return_to] = request.fullpath
  end
   def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end

  private
   
  def clear_return_to
     session.delete( :return_to)
   end

    def wrap_long_string(text, max_width = 30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                  text.scan(regex).join(zero_width_space)
    end
end
