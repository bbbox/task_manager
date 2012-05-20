ActiveAdmin.register Stage do
  menu :label => I18n.t('active_admin.stages')

  filter :name, label: I18n.t('active_admin.by_name')

  form do |f|
    f.inputs I18n.t('active_admin.stage') do
      f.input :name, label: I18n.t('active_admin.name')
    end
    f.buttons
  end
  
end
