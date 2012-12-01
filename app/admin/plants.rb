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
      f.input :short_name, label: I18n.t('active_admin.plants.form.short_name')
      f.input :country, label: I18n.t('active_admin.plants.form.country')
      f.input  :address, label: I18n.t('active_admin.plants.form.address')
    end
    f.buttons
  end

  index do
    column( I18n.t('active_admin.plants.index.short_name'), :short_name)  { |plant| link_to plant.short_name, admin_plant_path(plant) }
    column I18n.t('active_admin.plants.index.country'), :country
    column I18n.t('active_admin.plants.index.address'), :address
    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

  show title: :name do
    attributes_table do
      row :name
      row :short_name
      row :address
      row :country
    end
  end

end
