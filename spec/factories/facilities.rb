FactoryGirl.define do
  sequence(:facility_name){ |n| "FacilityName#{n}" }
  factory :facility do
    name { FactoryGirl.generate(:facility_name) }
    plant { FactoryGirl.create(:plant) }
  end
end