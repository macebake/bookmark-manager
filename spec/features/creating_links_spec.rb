# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

require_relative '../spec_helper'
require_relative 'web_helpers'

feature 'adding new links' do
  scenario 'add the address and the title to book manager'do
    add_link

    expect(current_path).to eq '/links'

    within 'ul#links'do
      expect(page).to have_content('http://www.makersacademy.com/about-us/')
    end
  end
end
