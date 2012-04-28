ActiveAdmin.register User do
  menu :label => I18n.t('active_admin.users')
  form do |f|
    f.inputs "Login" do
      f.input :login
      f.input :email
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end
