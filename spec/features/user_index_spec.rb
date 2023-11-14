require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  before do
    @anwar = User.create(name: 'Anwar Hussaini', photo: 'https://avatars.githubusercontent.com/u/131291114?v=4', bio: 'Full-Stak developer', posts_counter: 0)
    visit users_path
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content(@anwar.name)
  end

  scenario 'I can see the profile picture for each user.' do
    expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/131291114?v=4']")
  end

  scenario 'I can see the number of posts each user has written.' do
    expect(page).to have_content('Number of posts: 0')
  end

  scenario 'When I click on a user, I am redirected to that users show page.' do
    click_link @anwar.name do
      expect(page).to have_current_path("/users/#{User.last.id}")
    end
  end
end