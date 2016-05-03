feature 'adding links' do
  scenario 'submit a link using a form' do
    visit '/links/new'
    fill_in :url, with: "www.test.com"
    fill_in :title, with: "test"
    click_button "Submit"
    expect(page).to have_content "test"
  end
end
