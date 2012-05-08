def full_title(page_title)
  base_title = "Snipper"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end
  def auth_user
    user = Factory(:user)
    login(user)
    user
  end
 
  def login(user)
    login_as user, scope: :user
  end
