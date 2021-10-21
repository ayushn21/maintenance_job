module MaintenanceJob
  class PendingJobsError < StandardError
    include ActiveSupport::ActionableError

    action "Run pending maintenance jobs" do
      MaintenanceJob::Base.run_pending_jobs
    end
  end
end