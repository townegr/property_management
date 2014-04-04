require 'spec_helper'

describe BuildingRecord do
  let(:blank_values) { [nil, ''] }
  it { should have_valid(:address).when('123 School Street') }
  it { should_not have_valid(:address).when(*blank_values) }

  it { should have_valid(:city).when('Somerville') }
  it { should_not have_valid(:city).when(*blank_values) }

  it { should have_valid(:state).when('MA', 'TN', 'TX') }
  it { should_not have_valid(:state).when(*blank_values) }

  it { should have_valid(:postal_code).when('02143') }
  it { should_not have_valid(:postal_code).when(*blank_values) }
end
