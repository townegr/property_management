require 'spec_helper'

feature 'record a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do

  # ACCEPTANCE CRITERIA:
  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'an associate records a valid building entry' do
    prev_count = BuildingRecord.count
    visit new_building_record_path

    fill_in 'Address', with: '33 Harrison Avenue'
    fill_in 'City', with: 'Boston'
    select 'MA', from: 'State'
    fill_in 'Postal Code', with: '02111'
    fill_in 'Description', with: ''
    click_button 'Submit'

    expect(page).to have_content('Your building was recorded.')
    expect(BuildingRecord.count).to eq(prev_count + 1)
  end

  scenario 'an associate records an invalid building entry' do
    prev_count = BuildingRecord.count
    visit new_building_record_path
    click_button 'Submit'

    expect(page).to have_content("can't be blank")
    expect(BuildingRecord.count).to eq(prev_count)
  end
end
