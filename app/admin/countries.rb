ActiveAdmin.register Country do
  menu :label => I18n.t('active_admin.countries')

  filter :name, label: I18n.t('active_admin.by_name')

  form do |f|
    f.inputs I18n.t('active_admin.country') do
      f.input :name, label: I18n.t('active_admin.name')
    end
    f.buttons
  end


  index do
    column I18n.t('active_admin.name'), :name
    default_actions
  end
  
end
