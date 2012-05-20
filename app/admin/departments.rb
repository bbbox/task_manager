ActiveAdmin.register Department do
  menu :label => I18n.t('active_admin.departments')
  filter :name, label: I18n.t('active_admin.by_name')
  filter :chief, label: I18n.t('active_admin.chief')

  form do |f|
    f.inputs I18n.t('active_admin.department') do
      f.input :name, label: I18n.t('active_admin.name')
      f.input  :chief, label: I18n.t('active_admin.chief')
    end
    f.buttons
  end


  index do
    column I18n.t('active_admin.name'), :name
    column I18n.t('active_admin.chief'), :chief
    default_actions
  end
end
