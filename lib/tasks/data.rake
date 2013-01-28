namespace :data do
  desc "Generate some test data"
  task generate: :environment do
    Rake::Task["data:departments"].execute
    Rake::Task["data:users"].execute
    Rake::Task["data:stage"].execute
    Rake::Task["data:facility"].execute
  end

  task departments: :environment do
    ["first_department", "second_department", "third_department"].each do |name|
      unless Department.find_by_name name
        department = Department.new(name: name)
        department.department_head = User.create!(login: "chief_of_#{name}", email: "chief_#{name}@ua.fm", role: "employee",
                                        first_name: "first_name_chief_of_#{name}", last_name: "last_name_chief_of#{name}",
                                        password: "123456", password_confirmation: "123456", department: department, position: "staff").first_name
        department.save!
      end
    end
  end

  task users: :environment do
    unless User.find_by_email "admin@ua.fm"
      User.create!(login: "admin", email: "admin@ua.fm", first_name: "first_name_admin", role: "administrator",
                   last_name: "last_name_admin", department: Department.first, password: "123456",
                   password_confirmation: "123456", position: "staff")
    end
    unless User.find_by_email "guest@ua.fm"
      User.create!(login: "guest", email: "guest@ua.fm", first_name: "first_name_guest", role: "guest",
                   last_name: "last_name_guest", department: Department.first, password: "123456",
                   password_confirmation: "123456", position: "staff")
    end
    n = 0
    Department.all.each do |department|
      3.times do
        unless User.find_by_email "user#{n}@ua.fm"
          User.create!(login: "user#{n}_of_#{department.name}", email: "user#{n}@ua.fm", first_name: "first_name_#{n}", role: "employee",
                       last_name: "last_name_#{n}", department: department, password: "123456", password_confirmation: "123456", position: "staff")
        end
        n+= 1
      end
    end
  end

  task facility: :environment do
    ["first_plant", "second_plant", "third_plant"].each do |name|
      unless Plant.find_by_name name
        plant = Plant.create!(name: name, short_name: name)
        plant.facilities.create!(name: "facility_of_#{name}")
      end
    end
  end

  task stage: :environment do
    ["first_stage", "second_stage", "third_stage"].each do |name|
      Stage.create!(name: name)
    end
  end
end