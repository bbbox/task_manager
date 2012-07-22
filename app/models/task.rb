class Task < ActiveRecord::Base

  attr_accessible :number, :issued_department_id, :received_department_id, :facility_id,:stage_id, :contract_number,
                  :issued_chief_id, :received_chief_id, :issued_group_head_id, :received_group_head_id,
                  :received_staff_id, :chief_project_engineer_id, :issue_date, :description, :completion_date

  validates :number, presence: true
  validates :issued_department_id, presence: true
  validates :received_department_id, presence: true
  validates :facility_id, presence: true
  validates :stage_id, presence: true
  validates :contract_number, presence: true
  validates :issue_date, presence: true

  has_and_belongs_to_many :executors, class_name: "User", foreign_key: :user_id
  belongs_to :issued_department, class_name: "Department"
  belongs_to :received_department,class_name: "Department"
  belongs_to :facility
  belongs_to :issued_chief, class_name: "User"
  belongs_to :received_chief, class_name: "User"
  belongs_to :issued_group_head, class_name: "User"
  belongs_to :received_group_head, class_name: "User"
  belongs_to :received_staff, class_name: "User"
  belongs_to :chief_project_engineer, class_name: "User"
  belongs_to :stage
  has_many  :expiration

  #неназначенное, в работе, выполненное, приостановленное
=begin
  state_machine :state, initial: :active do
    event :assign do
      transition :active => :in_progress
    end
    event :pause do
      transition :in_progress => :paused
    end
    event :restart do
      transition :paused => :in_progress
    end
    event :complete do
      transition :in_progress => :done
    end
  end
=end

end
