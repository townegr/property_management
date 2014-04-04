# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building_record do
    address '1001 Webster Avenue'
    city 'Chicago'
    state 'IL'
    postal_code '60614'
    description 'Da Bears!'
  end
end
