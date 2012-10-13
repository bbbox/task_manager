ActiveAdmin::Dashboards.build do

  section I18n.t("active_admin.dashboards.active_tasks") do
    table_for Task.where('completion_date > ?', Time.now) do |t|
      t.column(t('active_admin.dashboards.number')) { |task| link_to task.number, admin_task_path(task) }
      t.column(t('active_admin.dashboards.plant')) { |task| task.facility.plant.short_name }
      t.column(t('active_admin.dashboards.facility')) { |task| task.facility.name }
      t.column(t('active_admin.dashboards.issue_date')) { |task| task.issue_date? ? l(task.issue_date, :format => :long) : '-' }
      t.column(t('active_admin.dashboards.received_staff')) { |task| "#{task.received_staff.last_name} #{task.received_staff.first_name}" }
    end
  end

  section I18n.t(".active_admin.dashboards.tasks_are_late") do
    table_for Task.where(' completion_date < ?', Time.now) do |t|
      t.column(t('active_admin.dashboards.number')) { |task| link_to task.number, admin_task_path(task) }
      t.column(t('active_admin.dashboards.plant')) { |task| task.facility.plant.short_name }
      t.column(t('active_admin.dashboards.facility')) { |task| task.facility.name }
      t.column(t('active_admin.dashboards.issue_date')) { |task| task.issue_date? ? l(task.issue_date, :format => :long) : '-' }
      t.column(t('active_admin.dashboards.received_staff')) { |task| "#{task.received_staff.last_name} #{task.received_staff.first_name}" }
    end
  end
end
