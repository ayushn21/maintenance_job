require "test_helper"

class MaintenanceJob::BaseTest < ActiveJob::TestCase
  setup do
    Maintenance::TestJob.count = 0
  end

  test "can only be run once" do
    Maintenance::TestJob.perform_now
    assert_equal 1, Maintenance::TestJob.count

    Maintenance::TestJob.perform_now
    assert_equal 1, Maintenance::TestJob.count
  end

  test "pending maintenance jobs are run when run_pending_jobs is called" do
    MaintenanceJob::Base.run_pending_jobs

    assert_equal 1, Maintenance::TestJob.count
  end

  test "is runnable if it hasn't been run before" do
    assert_equal 0, Maintenance::TestJob.count
    assert Maintenance::TestJob.runnable?
  end

  test "is not runnable if it has been run before" do
    Maintenance::TestJob.perform_now

    assert_equal 1, Maintenance::TestJob.count
    assert_not Maintenance::TestJob.runnable?
  end
end
