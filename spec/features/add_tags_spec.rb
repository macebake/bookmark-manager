require_relative '../spec_helper'
require_relative 'web_helpers'

feature 'adding tags to links' do
  scenario "adds one tag to the link" do
    add_link

    link = Link.first
    expect(link.tags.map(&:name)).to include 'education'
  end
end
