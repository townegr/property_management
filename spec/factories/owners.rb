# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "test"
    last_name "owner"
    sequence(:email) {|n| "test#{n}@email"}
  end
end
