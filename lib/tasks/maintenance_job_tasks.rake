namespace :maintenance_job do
  desc "Copy the database migration to create a table for maintenance job runs"
  task :install do
    Rake::Task["maintenance_job:install:migrations"].execute
  end

  desc "Runs all pending maintenance jobs"
  task :execute_pending_jobs => :environment do
    MaintenanceJob::Base.run_pending_jobs
  end
end
