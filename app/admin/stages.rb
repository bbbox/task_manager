ActiveAdmin.register Stage do
  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_stages_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_stages_url }
      end
    end
  end

  menu :label => I18n.t('.stages')

  filter :name, label: I18n.t('active_admin.stages.filter.by_name')

  form do |f|
    f.inputs I18n.t('active_admin.stages.form.stage') do
      f.input :name, label: I18n.t('active_admin.stages.form.name')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.stages.index.name'), :name
    default_actions
  end
  
end
