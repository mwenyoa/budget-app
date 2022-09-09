require 'rails_helper'

RSpec.feature 'Category', type: :feature do
  background do
    visit '/'
    click_link 'SIGN UP'
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email',	with: 'john123@gmail.com'
    fill_in 'Password',	with: 'password'
    fill_in 'Password confirmation',	with: 'password'
    click_button 'Sign UP'
  end

  scenario 'Welcome! You have signed up successfully.' do
    expect(page).to have_content('Log Out')
  end

  scenario 'New Category' do
    click_link 'ADD CATEGORY'
    fill_in 'Category Name', with: 'Test'
    attach_file('Image or Icon', 'app/assets/images/dai.png')
    find('input[name="commit"]').click
    expect(page).to have_content('Test')
  end
end
