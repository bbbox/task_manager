require 'spec_helper'

describe Facility do
  it "should create facility with valid attributes" do
    lambda{
      FactoryGirl.create(:facility)
    }.should change{Facility.count}.by(1)
  end

  it { should belong_to :plant }

  it { should validate_presence_of :name }

end