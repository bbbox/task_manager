require 'spec_helper'

describe Expiration do
  it { should validate_presence_of :task_id }

  it { should belong_to :task  }

end
