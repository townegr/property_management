require 'spec_helper'

feature 'create association between owner and building', %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
  } do

  # ACCEPTANCE CRITERIA:
  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'an owner has many buildings' do
    owner = FactoryGirl.create(:owner)
    visit new_building_record_path
    fill_in 'Address', with: '33 Harrison Avenue'
    fill_in 'City', with: 'Boston'
    select 'MA', from: 'State'
    fill_in 'Postal Code', with: '02111'
    fill_in 'Description', with: ''
    select owner.full_name, from: 'Owner'
    click_on 'Submit'

    expect(page).to have_content('Your building was recorded.')
    expect(page).to have_content(owner.full_name)
  end

  scenario 'deleting an owner' do
    FactoryGirl.create(:owner, first_name: 'Jake')
    FactoryGirl.create_list(:owner, 10)
    visit owners_path
    owner_count = Owner.count
    expect(page).to have_content('Jake')
    click_on 'Destroy Jake'
    expect(page).to_not have_content('Jake')
    expect(Owner.count).to eq(owner_count - 1)
  end
end
