require 'spec_helper'

describe Plant do

  it "should create plant with valid attributes" do
    lambda{
      FactoryGirl.create(:plant)
    }.should change{Plant.count}.by(1)
  end

  it { should have_many :facilities }

  it { should validate_presence_of :short_name }

end