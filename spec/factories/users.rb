FactoryGirl.define do
  sequence(:email){ |n| "email#{n}@example.com" }
  sequence(:login){ |n| "user_name_#{n}" }
  sequence(:position){ |n| "position#{n}" }
  factory :user do
    login { FactoryGirl.generate(:login) }
    email { FactoryGirl.generate(:email) }
    first_name { Faker::Name::first_name }
    last_name { Faker::Name::last_name }
    position { FactoryGirl.generate(:position) }
    department { FactoryGirl.create(:department) }
    role "employee"
    middle_name "middle_name"
    password "password"
  end

end