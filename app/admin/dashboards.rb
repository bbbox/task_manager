ActiveAdmin::Dashboards.build do

  section I18n.t("active_admin.dashboards.your_tasks_for_this_week") do
    table_for Task.where('received_staff_id = ? and completion_date > ? and "completion_date" < ?', current_user.id, Time.now, 1.week.from_now) do |t|
      t.column(t('active_admin.dashboards.status')) do  |task|
       if task.state == "active"
         status_tag "Active", :error
       elsif task.state == "in_progress"
         status_tag "In Progress", :error
       elsif task.state == "done"
         status_tag "Done", :ok
       elsif task.state == "paused"
         status_tag "Paused", :error
       end
      end
      t.column(t('active_admin.dashboards.number')) { |task| link_to task.number, admin_task_path(task) }
      t.column(t('active_admin.dashboards.completion_date')) { |task| task.completion_date? ? l(task.completion_date, :format => :long) : '-' }
    end
  end

  section I18n.t(".active_admin.dashboards.tasks_are_late") do
    table_for Task.where('received_staff_id = ? and completion_date < ?',current_user.id, Time.now) do |t|
      t.column(t('active_admin.dashboards.status')) do  |task|
        if task.state == "active"
          status_tag "Active", :error
        elsif task.state == "in_progress"
          status_tag "In Progress", :error
        elsif task.state == "done"
          status_tag "Done", :ok
        elsif task.state == "paused"
          status_tag "Paused", :error
        end
      end
      t.column(t('active_admin.dashboards.number')) { |task| link_to task.number, admin_task_path(task) }
      t.column(t('active_admin.dashboards.completion_date')) { |task| task.completion_date? ? l(task.completion_date, :format => :long) : '-' }
    end
  end
end