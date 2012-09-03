ActiveAdmin.register User do
  controller.authorize_resource
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_users_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_users_url }
      end
    end
  end

  menu :label => I18n.t('.users')

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
      f.input :department, label: I18n.t('active_admin.users.form.department')
      f.input :position, label: I18n.t('active_admin.users.form.position')
      f.input :email
      f.input :password, label:  I18n.t('active_admin.users.form.password')
      f.input :password_confirmation,  label: I18n.t('active_admin.users.form.password_confirmation')
      f.input :role, as: :select, collection: User::ROLES.collect{ |role| [t('active_admin.roles.'+role), role] }, label: I18n.t('active_admin.role')
    end
    f.buttons
  end

  index do
    column I18n.t('active_admin.users.index.login'), :login
    column I18n.t('active_admin.users.index.last_name'), :last_name
    column I18n.t('active_admin.users.index.first_name'), :first_name
    column I18n.t('active_admin.users.index.middle_name'), :middle_name
    column I18n.t('active_admin.users.index.department'), :department
    column I18n.t('active_admin.users.index.position'), :position
    column :email
    default_actions
  end

end
