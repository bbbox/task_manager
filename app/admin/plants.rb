ActiveAdmin.register Plant do

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_plants_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_plants_url }
      end
    end
  end

  menu :label => I18n.t('active_admin.plants')

  filter :name, label: I18n.t('active_admin.by_name')

  form do |f|
    f.inputs I18n.t('active_admin.plant') do
      f.input :name, label: I18n.t('active_admin.name')
      f.input :country, label: I18n.t('active_admin.country')
      f.input  :address, label: I18n.t('active_admin.address')
    end
    f.buttons
  end

  index do
    column( I18n.t('active_admin.name'), :name)  { |plant| link_to plant.name, admin_tasks_path }
    column I18n.t('active_admin.address'), :address
    default_actions
  end

end
