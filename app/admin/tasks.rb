ActiveAdmin.register Task do

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_tasks_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_tasks_url }
      end
    end
  end

  menu :label => I18n.t('.active_admin.tasks')

  scope :all, :default => true, label: I18n.t('.active_admin.all')

  scope I18n.t('.active_admin.department_tasks'), :department_tasks do |tasks|
    tasks.where('received_department_id = ?', current_user.department_id)
  end

  scope I18n.t('.active_admin.from_department_tasks'), :from_department_tasks do |tasks|
    tasks.where('issued_department_id = ?', current_user.department_id)
  end

  scope I18n.t('.active_admin.complete_this_week'), :complete_this_week do |tasks|
    tasks.where('completion_date > ? and completion_date < ?', Time.now, 1.week.from_now)
  end

  scope I18n.t('.active_admin.late'), :late do |tasks|
    tasks.where('completion_date < ?', Time.now)
  end

  filter :issued_department, label: I18n.t('.active_admin.issued_department')
  filter :received_department, label: I18n.t('.active_admin.received_department')
  filter :facility, label: I18n.t('.active_admin.facility')
  filter :number, label: I18n.t('.active_admin.by_number')
  filter :issue_date, label: I18n.t('active_admin.issue_date')
  filter :received_staff, label: I18n.t('.active_admin.received_staff')
  filter :state

  form do |f|
    f.inputs I18n.t('.active_admin.task') do
      f.input  :number, label: I18n.t('active_admin.number')
      f.input  :contract_number, label: I18n.t('.active_admin.contract_number')
      f.input  :stage, label: I18n.t('active_admin.stage')
      f.input  :issue_date, label: I18n.t('active_admin.issue_date')
      f.input  :completion_date, label: I18n.t('active_admin.completion_date')
      f.input  :issued_department, label: I18n.t('active_admin.issued_department')
      f.input  :received_department, label: I18n.t('active_admin.received_department')
      f.input  :facility, label: I18n.t('active_admin.facility')
      f.input  :issued_chief, label: I18n.t('active_admin.issued_chief')
      f.input  :received_chief, label: I18n.t('active_admin.received_chief')
      f.input  :issued_group_head, label: I18n.t('active_admin.issued_group_head')
      f.input  :received_group_head, label: I18n.t('active_admin.received_group_head')
      f.input  :received_staff, label: I18n.t('active_admin.received_staff')
      f.input  :chief_project_engineer, label: I18n.t('active_admin.chief_project_engineer')
      f.input  :description, label: I18n.t('active_admin.description')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.number'), :number
    column I18n.t('active_admin.plant') do |task|
      task.facility.plant.name
    end
    column I18n.t('active_admin.facility'), :facility
    column I18n.t('active_admin.received_staff'), :received_staff
    column I18n.t('active_admin.stage'), :stage
    column I18n.t('active_admin.description'), :description
    column I18n.t('active_admin.issue_date'), :issue_date
    column I18n.t('active_admin.state'), :state

    default_actions
  end

end
