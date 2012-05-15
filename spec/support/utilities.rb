require 'spec_helper'

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

  def hard_login( user)
      visit signin_path
      fill_in 'user_login', with: user.email
      fill_in 'user_password', with: user.password
      click_button "Sign in"
      visit root_path
  end
