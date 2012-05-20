ActiveAdmin.register User do
  menu :label => I18n.t('active_admin.users')
  filter :login, label: I18n.t('active_admin.by_login')
  filter :last_name, label: I18n.t('active_admin.by_last_name')
  filter :first_name, label: I18n.t('active_admin.by_first_name')
  filter :middle_name, label: I18n.t('active_admin.by_middle_name')
  filter :department, label: I18n.t('active_admin.department')
  filter :position, label: I18n.t('active_admin.by_position')
  filter :email

  form do |f|
    f.inputs I18n.t('active_admin.user') do
      f.input :login, label: I18n.t('active_admin.login')
      f.input  :last_name, label: I18n.t('active_admin.last_name')
      f.input :first_name, label: I18n.t('active_admin.first_name')
      f.input :middle_name, label:  I18n.t('active_admin.middle_name')
      f.input :department, label: I18n.t('active_admin.department')
      f.input :position, label: I18n.t('active_admin.position')
      f.input :email
      f.input :password, label:  I18n.t('active_admin.password')
      f.input :password_confirmation,  label: I18n.t('active_admin.password_confirmation')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.login'), :login
    column I18n.t('active_admin.last_name'), :last_name
    column I18n.t('active_admin.first_name'), :first_name
    column I18n.t('active_admin.middle_name'), :middle_name
    column I18n.t('active_admin.department'), :department
    column I18n.t('active_admin.position'), :position
    column :email
    default_actions
  end
end
