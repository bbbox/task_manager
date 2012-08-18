ActiveAdmin::Dashboards.build do

  section I18n.t(".active_admin.dashboards.your_tasks_for_this_week") do
    table_for Task.where('received_staff_id = ? and completion_date > ? and "completion_date" < ?', current_user.id, Time.now, 1.week.from_now) do |t|
      t.column(t('active_admin.status')) do  |task|
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
      t.column(t('active_admin.number')) { |task| link_to task.number, admin_task_path(task) }
      t.column(t('active_admin.completion_date')) { |task| task.completion_date? ? l(task.completion_date, :format => :long) : '-' }
    end
  end

  section I18n.t(".active_admin.dashboards.tasks_are_late") do
    table_for Task.where('received_staff_id = ? and completion_date < ?',current_user.id, Time.now) do |t|
      t.column(t('active_admin.status')) do  |task|
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
      t.column(t('active_admin.number')) { |task| link_to task.number, admin_task_path(task) }
      t.column(t('active_admin.completion_date')) { |task| task.completion_date? ? l(task.completion_date, :format => :long) : '-' }
    end
  end



  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

  #section "Your tasks for this week" do
   # table_for current_user.tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now) do |t|
    #  t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
     # t.column("Title") { |task| link_to task.title, admin_task_path(task) }
     # t.column("Assigned To") { |task| task.admin_user.email }
     # t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    #end
  #end

 # section "Tasks that are late" do
  #  table_for current_user.tasks.where('due_date < ?', Time.now) do |t|
     # t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
     # t.column("Title") { |task| link_to task.title, admin_task_path(task) }
     # t.column("Assigned To") { |task| task.admin_user.email }
     # t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    #end
  #end
end

#end
