class MaintenanceJob::EnsureNoPendingJobsTest < ActionDispatch::IntegrationTest
  test "raises error when there are pending jobs" do
    assert_raise MaintenanceJob::PendingJobsError do
      get test_no_pending_jobs_path
    end
  end
end