require 'rails_helper'

RSpec.describe 'Accounts', type: :system do
  let!(:country) { create(:country) }

  it 'can create new account' do
    visit landing.new_account_path

    fill_in 'Primary Domain', with: 'al-nour'
    fill_in 'Email Address', with: 'al-nour@test.test'
    fill_in 'Responsable Name', with: 'Test Name'
    fill_in 'Mosque Name', with: 'Al nour Moschee'
    fill_in 'Phone Number', with: '0123456789'
    fill_in 'Address', with: 'Sievekingsallee 191', id: 'account_address_attributes_address1'
    fill_in 'Zip Code', with: '22111'
    fill_in 'City', with: 'Hamburg'
    fill_in 'Region', with: 'Hamburg'
    select 'Germany', from: 'Country'

    click_button 'Create Account'

    expect(page).to have_text('Your account was created successfully')
  end

  it 'cannot create new account with invalid data' do
    visit landing.new_account_path

    fill_in 'Address', with: 'Invalid address', id: 'account_address_attributes_address1'
    fill_in 'Zip Code', with: '22111'
    fill_in 'City', with: 'Hamburg'
    fill_in 'Region', with: 'Hamburg'
    select 'Germany', from: 'Country'
    click_button 'Create Account'

    expect(page).to have_text('Primary Domain can\'t be blank')
    expect(page).to have_text('Address geocoding failed')
  end
end
