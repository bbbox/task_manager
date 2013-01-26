require 'spec_helper'

describe Department do
  it "should create department with valid attributes" do
    lambda{
      FactoryGirl.create(:department)
    }.should change{Department.count}.by(1)
  end
  it { should have_many :users }

  it { should validate_presence_of :name }
  it { should validate_presence_of :department_head }

end