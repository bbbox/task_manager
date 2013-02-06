require 'spec_helper'

describe Task do
  it "should create task with valid attributes" do
    lambda{
      FactoryGirl.create(:task)
    }.should change{Task.count}.by(1)
  end

  it "should validate presence issued department" do
    task = FactoryGirl.build(:task, issued_department: nil)
    task.should_not be_valid
  end

  it "should validate presence received department" do
    task = FactoryGirl.build(:task, received_department: nil)
    task.should_not be_valid
  end

  it "should validate presence facility" do
    task = FactoryGirl.build(:task, facility: nil)
    task.should_not be_valid
  end

  it "should validate presence stage" do
    task = FactoryGirl.build(:task, stage: nil)
    task.should_not be_valid
  end

  it { should validate_presence_of :number }

  it { should have_and_belong_to_many :executors }
  it { should belong_to :issued_department }
  it { should belong_to :received_department }
  it { should belong_to :facility }
  it { should belong_to :issued_group_head }
  it { should belong_to :received_group_head }
  it { should belong_to :received_staff }
  it { should belong_to :chief_project_engineer }
end
