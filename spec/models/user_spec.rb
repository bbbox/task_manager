require 'spec_helper'

describe User do

  it { should have_and_belong_to_many :tasks }
  it { should belong_to :department }


  ####
 # it { should have_many :tasks }


  it { should validate_presence_of :login }

end