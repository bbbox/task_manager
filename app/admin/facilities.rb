ActiveAdmin.register Facility, :namespace => false do
  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to facilities_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to facilities_url }
      end
    end
  end

  menu :label => I18n.t('.facilities')

  filter :name, label: I18n.t('active_admin.facilities.filter.by_name')
  filter :serial, label: I18n.t('active_admin.facilities.filter.by_serial')
  filter :plant, label: I18n.t('active_admin.facilities.filter.by_plant')

  form do |f|
    f.inputs I18n.t('active_admin.facilities.form.facility') do
      f.input :name, label: I18n.t('active_admin.facilities.form.name')
      f.input  :serial, label: I18n.t('active_admin.facilities.form.serial')
      f.input  :plant, label: I18n.t('active_admin.facilities.form.plant')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.facilities.index.name'), :name
    column I18n.t('active_admin.facilities.index.serial'), :serial
    column I18n.t('active_admin.facilities.index.plant'), :plant, sortable: :name
    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

  show title: :name do
    attributes_table_for facility do
      row :id
      row(t('active_admin.facilities.show.name')) { facility.name }
      row(t('active_admin.facilities.show.serial')) { facility.serial }
      row(t('active_admin.facilities.show.plant')) { facility.plant.name }
    end
  end
  
end
