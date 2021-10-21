class MaintenanceJob::Generator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def generate_job_files
    template "maintenance_job.rb.erb", "app/jobs/maintenance/#{file_name}_job.rb"
    template "maintenance_job_test.rb.erb", "test/jobs/maintenance/#{file_name}_job_test.rb"
  end
end
