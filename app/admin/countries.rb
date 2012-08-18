ActiveAdmin.register Country do

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_countries_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_countries_url }
      end
    end
  end


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
