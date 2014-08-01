require 'rails_helper'


feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('has been created.')

  end

  scenario 'shows all cars on home page' do
    Car.create(make: 'Subaru', model: 'Impreza', year: '2002', price: '3000')
    Car.create(make: 'Honda', model: 'Civic', year: '1999', price: '1597')

    visit '/'

    expect(page).to have_content('Subaru')
    expect(page).to have_content('Impreza')
    expect(page).to have_content('2002')
    expect(page).to have_content('3000')
    expect(page).to have_content('Honda')
    expect(page).to have_content('Civic')
    expect(page).to have_content('1999')
    expect(page).to have_content('1597')
  end

  scenario 'can edit a car' do
    Car.create(make: 'Subaru', model: 'Impreza', year: '2002', price: '3000')
    visit '/cars/1/edit'

    fill_in 'Year', with: '2005'
    click_button 'Create Car'

    expect(page).to have_content('2005')
  end
end
