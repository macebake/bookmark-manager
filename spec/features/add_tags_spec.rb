require_relative '../spec_helper'

feature 'adding tags to links' do
  scenario "adds one tag to the link" do
    visit('/links/new')
    fill_in('title', :with => 'Makers Academy/about-us')
    fill_in('url', :with => 'http://www.makersacademy.com/about-us/')
    fill_in('tags', :with => 'education')
    click_button('add to links')

    link = Link.first
    expect(link.tags.map(&:name)).to include 'education'
  end
end
