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
  filter :department_head, label: I18n.t('active_admin.departments.filter.by_chief')

  form do |f|
    f.inputs I18n.t('active_admin.departments.form.department') do
      f.input :name, label: I18n.t('active_admin.departments.form.name')
      f.input  :department_head, label: I18n.t('active_admin.departments.form.chief')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.departments.index.name'), :name
    column I18n.t('active_admin.departments.index.chief'), :department_head
    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

  show title: :name do
    attributes_table_for department do
      row :id
      row(t('active_admin.departments.show.name')) { department.name }
      row(t('active_admin.departments.show.chief')) { department.department_head}
    end
  end
end
