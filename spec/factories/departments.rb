FactoryGirl.define do
  sequence(:department_name){ |n| "DepartmentName#{n}" }
  sequence(:department_head){ |n| "DepartmentHead#{n}" }
  factory :department do
    name { FactoryGirl.generate(:department_name) }
    department_head { FactoryGirl.generate(:department_head) }
  end
end
