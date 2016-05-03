feature 'list links' do
  scenario 'has a link' do
    Link.create(url:'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Maker Academy')
    end
  end
end
