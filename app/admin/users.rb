ActiveAdmin.register User, :namespace => false do
  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to users_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to users_url }
      end
    end
  end

  menu label: I18n.t('.users')

  filter :login, label: I18n.t('active_admin.users.filter.by_login')
  filter :last_name, label: I18n.t('active_admin.users.filter.by_last_name')
  filter :first_name, label: I18n.t('active_admin.users.filter.by_first_name')
  filter :middle_name, label: I18n.t('active_admin.users.filter.by_middle_name')
  filter :department, label: I18n.t('active_admin.users.filter.by_department')
  filter :position, label: I18n.t('active_admin.users.filter.by_position')
  filter :email

  form do |f|
    f.inputs I18n.t('.user') do
      f.input :login, label: I18n.t('active_admin.users.form.login')
      f.input  :last_name, label: I18n.t('active_admin.users.form.last_name')
      f.input :first_name, label: I18n.t('active_admin.users.form.first_name')
      f.input :middle_name, label:  I18n.t('active_admin.users.form.middle_name')
      f.input :phone_number, label:  I18n.t('active_admin.users.form.phone_number')
      f.input :department, label: I18n.t('active_admin.users.form.department')
      f.input :position, label: I18n.t('active_admin.users.form.position')
      f.input :email
      f.input :password, label:  I18n.t('active_admin.users.form.password')
      f.input :password_confirmation,  label: I18n.t('active_admin.users.form.password_confirmation')
      f.input :role, as: :select, collection: User::ROLES.collect{ |role| [t('active_admin.roles.'+role), role] }, label: I18n.t('active_admin.users.index.role')
    end
    f.buttons
  end

  index do
    column(I18n.t('active_admin.users.index.last_name'), :last_name)  { |user| link_to user.last_name, user_path(user) }
    column I18n.t('active_admin.users.index.first_name'), :first_name
    column I18n.t('active_admin.users.index.login'), :login
    column I18n.t('active_admin.users.form.phone_number'), :phone_number
    column I18n.t('active_admin.users.index.department'), :department
    column I18n.t('active_admin.users.index.position'), :position
    column :email
    column(I18n.t('active_admin.users.index.role'), :role)

    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link" unless current_user.id == resource.id
      links
    end
  end

  show title: :login do
    attributes_table_for user do
      row :id
      row(t('active_admin.users.show.last_name')) { user.last_name }
      row(t('active_admin.users.show.first_name')) { user.first_name }
      row(t('active_admin.users.show.middle_name')) { user.middle_name }
      row(t('active_admin.users.show.phone_number')) { user.phone_number }
      row(t('active_admin.users.show.login')) { user.login }
      row :email
      row(t('active_admin.users.show.department')) { user.department }
      row(t('active_admin.users.show.position')) { user.position }
      row(t('active_admin.users.show.role')) { user.role }
      row(t('active_admin.users.show.created_at')) { user.created_at }
    end
  end

end
