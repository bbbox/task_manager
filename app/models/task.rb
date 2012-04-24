class Task < ActiveRecord::Base

  validates :number, presence: true
  validates :issued_department_id, presence: true
  validates :received_department_id, presence: true
  validates :facility_id, presence: true
  validates :stage_id, presence: true
  validates :contract_number, presence: true
  validates :issued_chief_id, presence: true
  validates :received_chief_id, presence: true
  validates :issued_group_head_id, presence: true
  validates :received_group_head_id, presence: true
  validates :received_staff_id, presence: true
  validates :chief_project_engineer_id, presence: true
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
  has_many :expiration
end
