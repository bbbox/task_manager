ActiveAdmin.register Plant do
  menu :label => I18n.t('active_admin.plants')

  filter :name, label: I18n.t('active_admin.by_name')
  filter :serial, label: I18n.t('active_admin.by_serial')

  form do |f|
    f.inputs I18n.t('active_admin.plant') do
      f.input :name, label: I18n.t('active_admin.name')
      f.input  :serial, label: I18n.t('active_admin.serial')
      f.input  :address, label: I18n.t('active_admin.address')
    end
    f.buttons
  end
end
