class Task < ActiveRecord::Base

  after_create :set_departments_head

  attr_accessible :number, :issued_department_id, :received_department_id, :facility_id,:stage_id, :contract_number,
                  :issued_department_head, :received_department_head, :issued_group_head_id, :received_group_head_id,
                  :received_staff_id, :chief_project_engineer_id, :issue_date, :description, :completion_date

  default_scope order: :number

  validates :number, presence: true
  validates :issued_department, presence: true
  validates :received_department, presence: true
  validates :facility, presence: true
  validates :stage, presence: true
  validates :issue_date, presence: true

  has_and_belongs_to_many :executors, class_name: "User", foreign_key: :user_id
  belongs_to :issued_department, class_name: "Department"
  belongs_to :received_department,class_name: "Department"
  belongs_to :facility
  belongs_to :issued_group_head, class_name: "User"
  belongs_to :received_group_head, class_name: "User"
  belongs_to :received_staff, class_name: "User"
  belongs_to :chief_project_engineer, class_name: "User"
  belongs_to :stage

  private

    def set_departments_head
      self.update_attributes!( issued_department_head:  self.issued_department.department_head, received_department_head: self.received_department.department_head )
    end



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
