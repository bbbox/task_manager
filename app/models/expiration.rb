class Expiration < ActiveRecord::Base


  validates :task_id, presence: true

  belongs_to :task
end
