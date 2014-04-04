require 'spec_helper'

describe Owner do
  before(:each) do
    FactoryGirl.create(:owner)
  end
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
