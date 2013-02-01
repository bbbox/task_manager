ActiveAdmin.register Plant, :namespace => false do
  config.sort_order = "name_asc"
  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to plants_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to plants_url }
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
    column( I18n.t('active_admin.plants.index.short_name'), :short_name)  { |plant| link_to plant.short_name, plant_path(plant) }
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
    attributes_table_for plant do
      row(t('active_admin.plants.show.name')) { plant.name } 
      row(t('active_admin.plants.show.short_name')) { plant.short_name }
      row(t('active_admin.plants.show.address')) { plant.address}
      row(t('active_admin.plants.show.country')) { plant.country }
   end
  end

end
