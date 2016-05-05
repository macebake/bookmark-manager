def add_link
  visit('/links/new')
  fill_in('title', :with => 'Makers Academy/about-us')
  fill_in('url', :with => 'http://www.makersacademy.com/about-us/')
  fill_in('tags', :with => 'education')
  click_button('add to links')
end

def add_stupid_link
  visit('/links/new')
  fill_in('title', :with => 'Reddit')
  fill_in('url', :with => 'http://reddit.com')
  fill_in('tags', :with => 'stupidshit')
  click_button('add to links')
end

def add_link_with_multiple_tags
  visit('/links/new')
  fill_in('title', :with => 'Reddit')
  fill_in('url', :with => 'http://reddit.com')
  fill_in('tags', :with => 'stupidshit bubbles')
  click_button('add to links')
end

def sign_up
  visit('/users/new')
  fill_in('email', :with => 'daniel@daniel.com')
  fill_in('password', :with => 'hooray')
  click_button('Submit')
end
