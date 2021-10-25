namespace :maintenance_job do
  desc "Install the database migrations and file skeleton required for MaintenanceJob"
  task :install do
    Rake::Task["maintenance_job:install:migrations"].execute
    # Create `Maintenance` module in app/jobs
  end

  desc "Runs all pending maintenance jobs"
  task :execute_pending_jobs => :environment do
    MaintenanceJob::Base.run_pending_jobs
  end
end
