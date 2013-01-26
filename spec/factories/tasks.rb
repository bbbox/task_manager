FactoryGirl.define do
  sequence(:task_number){ |n| "task_number_#{n}" }
  sequence(:contract_number){ |n| "contract_number_#{n}" }
  factory :task do
    number { FactoryGirl.generate(:task_number) }
    issued_department { FactoryGirl.create(:department) }
    received_department { FactoryGirl.create(:department) }
    facility { FactoryGirl.create(:facility) }
    stage { FactoryGirl.create(:stage) }
    contract_number { FactoryGirl.generate(:contract_number) }
    issue_date { Date.today }
  end
end
