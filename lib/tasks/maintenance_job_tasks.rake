namespace :maintenance_job do
  desc "Install the database migrations and file skeleton required for MaintenanceJob"
  task :install do
    Dir.mkdir(Rails.root.join("app", "jobs", "maintenance"))
    File.write(Rails.root.join("app", "jobs", "maintenance", ".keep"), "")
    File.write(Rails.root.join("app", "jobs", "maintenance.rb"), "module Maintenance; end")
    puts "Created Maintenance module in Jobs directory"

    Rake::Task["maintenance_job:install:migrations"].execute
  end

  desc "Runs all pending maintenance jobs"
  task :execute_pending_jobs => :environment do
    MaintenanceJob::Base.run_pending_jobs
  end
end
