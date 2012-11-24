FactoryGirl.define do
	sequence(:plant_name){ |n| "PlantName#{n}" }
  factory :plant do
    short_name { FactoryGirl.generate(:plant_name) }
  end
end