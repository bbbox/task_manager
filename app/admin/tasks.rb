ActiveAdmin.register Task do

  menu :label => I18n.t('active_admin.tasks')

  filter :issued_department, label: I18n.t('active_admin.issued_department')
  filter :received_department, label: I18n.t('active_admin.received_department')
  filter :facility, label: I18n.t('active_admin.facility')
  filter :number, label: I18n.t('active_admin.by_number')
  filter :issue_date, label: I18n.t('active_admin.issue_date')

  form do |f|
    f.inputs I18n.t('active_admin.task') do
      f.input  :number, label: I18n.t('active_admin.number')
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
    column I18n.t('active_admin.description'), :description
    column I18n.t('active_admin.facility'), :facility
    column I18n.t('active_admin.issue_date'), :issue_date

    default_actions
  end

end
