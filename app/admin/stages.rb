ActiveAdmin.register Stage, :namespace => false do

  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to stages_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to stages_url }
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
    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

  show title: :name do
    attributes_table_for stage do
      row :id
      row(t('active_admin.stages.show.name')) { stage.name }
    end
  end
  
end
