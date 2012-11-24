FactoryGirl.define do
  sequence(:department_name){ |n| "DepartmentName#{n}" }
  factory :department do
    name { FactoryGirl.generate(:department_name) }
    before_create do |department|
      department.chief = FactoryGirl.create(:user, department: department)
    end
  end
end
