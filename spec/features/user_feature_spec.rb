require './models/user'
require 'features/web_helpers'

feature 'user can sign up' do
  scenario 'increments user count by 1' do
    expect{sign_up}.to change(User, :count).by 1
  end

  scenario 'displays welcome page after sign up' do
    sign_up
    expect(page).to have_content 'Welcome'
  end

  scenario 'stores the correct email address' do
    sign_up
    expect(User.email).to eq 'daniel@daniel.com'
  end

end
