require 'spec_helper'

describe Task do

  it { should validate_presence_of :number }
  it { should validate_presence_of :issued_department_id }
  it { should validate_presence_of :received_department_id }
  it { should validate_presence_of :facility_id }
  it { should validate_presence_of :stage_id }
  it { should validate_presence_of :contract_number }
  it { should validate_presence_of :issued_chief_id }
  it { should validate_presence_of :received_chief_id }
  it { should validate_presence_of :issued_group_head_id }
  it { should validate_presence_of :received_group_head_id }
  it { should validate_presence_of :received_staff_id}
  it { should validate_presence_of :chief_project_engineer_id}
  it { should validate_presence_of :issue_date }


  it { should have_and_belong_to_many :executors }
  it { should belong_to :issued_department }
  it { should belong_to :received_department }
  it { should belong_to :facility }
  it { should belong_to :issued_chief }
  it { should belong_to :received_chief }
  it { should belong_to :issued_group_head }
  it { should belong_to :received_group_head }
  it { should belong_to :received_staff }
  it { should belong_to :chief_project_engineer }
  it { should have_many :expiration }


end