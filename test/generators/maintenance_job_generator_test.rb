require "test_helper"
require "generators/maintenance_job_generator"

class MaintenanceJob::GeneratorTest < Rails::Generators::TestCase
  destination File.expand_path("../../tmp", __dir__)
  setup :prepare_destination
  tests MaintenanceJobGenerator

  arguments ["normalize_data"]

  test "maintenance job is created" do
    freeze_time
    run_generator

    assert_file "app/jobs/maintenance/normalize_data_job.rb" do |job_file|
      assert_match(/class Maintenance::NormalizeDataJob < MaintenanceJob::Base/, job_file)
      assert_match(/def perform/, job_file)
      assert_match(/#{Time.now.strftime("%Y%m%d%H%M%S")}/, job_file)
    end

    assert_file "test/jobs/maintenance/normalize_data_job_test.rb" do |test_file|
      assert_match(/class Maintenance::NormalizeDataJobTest < ActiveJob::TestCase/, test_file)
    end
  end
end