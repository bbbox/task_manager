ActiveAdmin.register Plant do
  controller.authorize_resource
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

  menu :label => I18n.t('.plants')

  filter :name, label: I18n.t('active_admin.plants.by_name')

  form do |f|
    f.inputs I18n.t('active_admin.plants.form.plant') do
      f.input :name, label: I18n.t('active_admin.plants.form.name')
      f.input :country, label: I18n.t('active_admin.plants.form.country')
      f.input  :address, label: I18n.t('active_admin.plants.form.address')
    end
    f.buttons
  end

  index do
    column( I18n.t('active_admin.plants.index.name'), :name)  { |plant| link_to plant.name, admin_tasks_path }
    column I18n.t('active_admin.plants.index.country'), :country
    column I18n.t('active_admin.plants.index.address'), :address
    default_actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :address
      row :country
    end
  end

end
