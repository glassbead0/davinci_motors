require 'spec_helper'

feature 'User Authentication' do
  scenario 'allows a user to singup' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link 'Signup'

    fill_in 'First name', with: 'bob'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'bob@smith.com'
    fill_in 'Password', with: 'sup3rs3krit'
    fill_in 'Password confirmation', with: 'sup3rs3krit'

    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as bob@smith.com')
  end


  scenario 'allows existing users to login' do
    user = FactoryGirl.create(:user, password: 'sup3rs3krit')
    visit '/'

    expect(page).to have_link('Login')
    click_link 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'sup3rs3krit'

    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name}")
    expect(page).to have_text("Signed in as #{user.email}")

  end

  scenario 'dont allow login if password is wrong' do
    user = FactoryGirl.create(:user, password: 'sup3rs3krit')
    visit '/'

    expect(page).to have_link('Login')
    click_link 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongPassword'

    click_button 'Login'

    expect(page).to have_text("Oops, something went wrong")

  end

  scenario 'allow a user to log out' do
    @user = FactoryGirl.create(:user, password: 's3krit')

    # log the user in
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 's3krit'
    click_button 'Login'

    visit '/'

    expect(page).to have_text("#{@user.email}")
    expect(page).to have_link('Logout')

    click_link 'Logout'

    expect(page).to have_text("See you next time #{@user.email}")
    expect(page).to_not have_text("Welcome back #{@user.first_name}")
  end
end
