require_relative '../spec_helper'
require_relative 'web_helpers'

feature 'adding tags to links' do
  scenario "adds one tag to the link" do
    add_link
    link = Link.first
    expect(link.tags.map(&:name)).to include 'education'
  end
end

feature 'adds multiple tags' do
  scenario 'shows multiple tags' do
    add_link_with_multiple_tags
    link = Link.first
    expect(link.tags.map(&:name)).to include('stupidshit', 'bubbles')
  end
end
