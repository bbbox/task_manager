require 'spec_helper'

describe User do

  it { should have_and_belong_to_many :tasks }

  it { should belong_to :department }


  ####
 # it { should have_many :tasks }


  it { should validate_presence_of :login }

  describe "should have unique login" do
    before(:each) do
      FactoryGirl.create(:user)
    end
    it { should validate_uniqueness_of :login }
  end

end