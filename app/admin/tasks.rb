ActiveAdmin.register Task do
  controller.authorize_resource

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_tasks_url }
      end
    end

    def edit
      authorize! :manage, Task.find_by_id(params[:id])
    end

    def update
      authorize! :manage, Task.find_by_id(params[:id])
      update! do |format|
        format.html { redirect_to admin_tasks_url }
      end
    end
  end

  menu :label => I18n.t('.tasks')

  scope :all, :default => true, label: I18n.t('active_admin.tasks.scope.all')

  scope I18n.t('active_admin.tasks.scope.department_tasks'), :department_tasks do |tasks|
    tasks.where('received_department_id = ?', current_user.department_id)
  end

  scope I18n.t('active_admin.tasks.scope.from_department_tasks'), :from_department_tasks do |tasks|
    tasks.where('issued_department_id = ?', current_user.department_id)
  end

  scope I18n.t('active_admin.tasks.scope.complete_this_week'), :complete_this_week do |tasks|
    tasks.where('completion_date > ? and completion_date < ?', Time.now, 1.week.from_now)
  end

  scope I18n.t('active_admin.tasks.scope.late'), :late do |tasks|
    tasks.where('completion_date < ?', Time.now)
  end

  filter :issued_department, label: I18n.t('active_admin.tasks.filter.by_issued_department')
  filter :received_department, label: I18n.t('active_admin.tasks.filter.by_received_department')
  filter :facility, label: I18n.t('active_admin.tasks.filter.by_facility')
  filter :number, label: I18n.t('active_admin.tasks.filter.by_number')
  filter :issue_date, label: I18n.t('active_admin.tasks.filter.by_issue_date')
  filter :received_staff, label: I18n.t('active_admin.tasks.filter.by_received_staff')
  filter :state, label: I18n.t('active_admin.tasks.filter.by_state')

  form do |f|
    f.inputs I18n.t('active_admin.tasks.form.task') do
      f.input  :number, label: I18n.t('active_admin.tasks.form.number')
      f.input  :contract_number, label: I18n.t('active_admin.tasks.form.contract_number')
      f.input  :stage, label: I18n.t('active_admin.tasks.form.stage')
      f.input  :issue_date, label: I18n.t('active_admin.tasks.form.issue_date')
      f.input  :completion_date, label: I18n.t('active_admin.tasks.form.completion_date')
      f.input  :issued_department, label: I18n.t('active_admin.tasks.form.issued_department')
      f.input  :received_department, label: I18n.t('active_admin.tasks.form.received_department')
      f.input  :facility, label: I18n.t('active_admin.tasks.form.facility')
      f.input  :issued_chief, label: I18n.t('active_admin.tasks.form.issued_chief')
      f.input  :received_chief, label: I18n.t('active_admin.tasks.form.received_chief')
      f.input  :issued_group_head, label: I18n.t('active_admin.tasks.form.issued_group_head')
      f.input  :received_group_head, label: I18n.t('active_admin.tasks.form.received_group_head')
      f.input  :received_staff, label: I18n.t('active_admin.tasks.form.received_staff')
      f.input  :chief_project_engineer, label: I18n.t('active_admin.tasks.form.chief_project_engineer')
      f.input  :description, label: I18n.t('active_admin.tasks.form.description')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.tasks.index.number'), :number
    column I18n.t('active_admin.tasks.index.plant') do
      |task| task.facility.plant.short_name
    end
    column I18n.t('active_admin.tasks.index.facility'), :facility
    column I18n.t('active_admin.tasks.index.facility_serial') do
      |task| task.facility.serial
    end
    column I18n.t('active_admin.tasks.index.received_staff'), :received_staff
    column I18n.t('active_admin.tasks.index.stage'), :stage
    column I18n.t('active_admin.tasks.index.description'), :description
    column I18n.t('active_admin.tasks.index.issue_date'), :issue_date
    column I18n.t('active_admin.tasks.index.state'), :state

    default_actions
  end

end
