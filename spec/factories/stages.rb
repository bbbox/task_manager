FactoryGirl.define do
  sequence(:stage_name){ |n| "stage_name_#{n}" }
  factory :stage do
    name { FactoryGirl.generate(:stage_name) }
  end
end
