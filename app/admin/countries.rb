ActiveAdmin.register Country, :namespace => false do

  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to countries_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to countries_url }
      end
    end
  end

  actions :all, :except => :show

  menu :label => I18n.t('.countries')

  filter :name, label: I18n.t('active_admin.countries.filter.by_name')

  form do |f|
    f.inputs I18n.t('active_admin.countries.form.country') do
      f.input :name, label: I18n.t('active_admin.countries.form.name')
    end
    f.buttons
  end


  index do
    column I18n.t('active_admin.countries.index.name'), :name
    default_actions
  end
  
end
