require_relative '../spec_helper'

feature 'Viewing links' do

  scenario 'shows the links in a page' do
    Link.create(link: "http://www.makersacademy.com/", title: 'Makers')
    visit '/'
    expect(page).to have_content 'Makers'
  end
end
