
require_relative '../spec_helper'

feature 'should filter tags' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'displays only the selected tags' do
    add_link
    add_stupid_link
    fill_in('filter', :with => 'stupidshit')
    click_button("filter by this tag")
    expect(page).to have_content('stupidshit')
    expect(page).to have_no_content('education')
  end

  scenario 'I can filter links by tag' do
  visit 'links'
  fill_in('filter', :with => 'bubbles')
  click_button("filter by this tag")

  expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
