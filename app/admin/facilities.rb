ActiveAdmin.register Facility do
  menu :label => I18n.t('active_admin.facilities')

  filter :name, label: I18n.t('active_admin.by_name')
  filter :serial, label: I18n.t('active_admin.by_serial')
  filter :plant, label: I18n.t('active_admin.by_plant')

  form do |f|
    f.inputs I18n.t('active_admin.facility') do
      f.input :name, label: I18n.t('active_admin.name')
      f.input  :serial, label: I18n.t('active_admin.serial')
      f.input  :plant, label: I18n.t('active_admin.plant')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.name'), :name
    column I18n.t('active_admin.serial'), :serial
    column I18n.t('active_admin.plant'), :plant
    default_actions
  end

  show title: :name do
    attributes_table do
      row :id
      row :name
      row :serial
      row :plant
    end
  end
  
end
