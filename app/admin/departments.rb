ActiveAdmin.register Department do
  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_departments_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_departments_url }
      end
    end
  end

  menu :label => I18n.t('.departments')

  filter :name, label: I18n.t('active_admin.departments.filter.by_name')
  filter :chief, label: I18n.t('active_admin.departments.filter.by_chief')

  form do |f|
    f.inputs I18n.t('active_admin.departments.form.department') do
      f.input :name, label: I18n.t('active_admin.departments.form.name')
      f.input  :chief, label: I18n.t('active_admin.departments.form.chief')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.departments.index.name'), :name
    column I18n.t('active_admin.departments.index.chief'), :chief
    default_actions
  end
end
