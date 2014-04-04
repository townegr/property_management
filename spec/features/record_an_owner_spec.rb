require 'spec_helper'

feature 'record a building owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
  } do

  # ACCEPTANCE CRITERIA:
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'create a building owner' do
    prev_count = Owner.count
    visit new_owner_path
    fill_in 'First name', with: 'Mike'
    fill_in 'Last name', with: 'Ditka'
    fill_in 'Email', with: 'thecoach@bears.com'
    fill_in 'Company', with: 'Chicago Sporst Network'

    click_on 'Create Owner'
    expect(page).to have_content('Successfully created owner')
    expect(Owner.count).to eq(prev_count + 1)
  end

  scenario 'create an invalid building owner' do
    prev_count = Owner.count
    visit new_owner_path
    click_button 'Create Owner'

    expect(page).to have_content("can't be blank")
    expect(Owner.count).to eq(prev_count)
  end
end
