

feature 'links on web page' do
  scenario 'check if link is bookmarked' do
    Link.create(title: "Gymbox", url: "http://gymbox.com/")
    visit ('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content 'Gymbox'
    end
  end
end

feature 'create new links' do
  scenario 'create new links' do
    visit '/links/new'
    fill_in "title", with: "Makers"
    fill_in "url", with: "http://www.makersacademy.com/"

    click_button 'submit'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'Makers'
    end
  end
end

feature 'Tags for links' do
  scenario 'a user can tag links when the link is added' do
    visit'/'
    click_button('add new link')
    fill_in('title', with: 'google')
    fill_in('url', with: 'google.com')
    fill_in('tag', with: 'search')
    click_button('submit')
    expect(page).to have_content('tags : search')
  end

  before(:each) do
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
  Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'user can filter links by tag' do
    visit '/tags/bubbles'
    expect(page).to have_content "This is Zombocom"
    expect(page).to have_content "Bubble Bobble"
    expect(page).not_to have_content "Makers Academy"
    expect(page).not_to have_content "Google"
    expect(page).not_to have_content "Code.org"
  end
end
