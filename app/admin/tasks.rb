ActiveAdmin.register Task do

  scope :all, :default => true
  scope :complete_this_week do |tasks|
    tasks.where('completion_date > ? and completion_date < ?', Time.now, 1.week.from_now)
  end
  scope :late do |tasks|
    tasks.where('completion_date < ?', Time.now)
  end

  menu :label => I18n.t('.active_admin.tasks')

  filter :issued_department, label: I18n.t('.active_admin.issued_department')
  filter :received_department, label: I18n.t('.active_admin.received_department')
  filter :facility, label: I18n.t('.active_admin.facility')
  filter :number, label: I18n.t('.active_admin.by_number')
  filter :issue_date, label: I18n.t('.active_admin.issue_date')
  filter :received_staff, label: I18n.t('.active_admin.received_staff')
  filter :state

  form do |f|
    f.inputs I18n.t('.active_admin.task') do
      f.input  :number, label: I18n.t('active_admin.number')
      f.input  :contract_number, label: I18n.t('.active_admin.contract_number')
      f.input  :stage, label: I18n.t('.active_admin.stage')
      f.input  :issue_date, lable: I18n.t('.active_admin.issue_date')
      f.input  :completion_date
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
    column I18n.t('active_admin.facility'), :facility
    column I18n.t('active_admin.received_staff'), :received_staff
    column I18n.t('active_admin.stage'), :stage
    column I18n.t('active_admin.description'), :description
    column I18n.t('active_admin.issue_date'), :issue_date
    column I18n.t('active_admin.state'), :state

    default_actions
  end

  show do
    panel "Task Details" do
      attributes_table_for task do
      #  row("Status") { status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      #  row("Title") { task.title }
     #   row("Project") { link_to task.project.title, admin_project_path(task.project) }
      #  row("Assigned To") { link_to task.user.email, user_path(task.user) }
        row("Due Date") { task.completion_date? ? l(task.completion_date, :format => :long) : '-' }
      end
    end

    active_admin_comments
  end

end
