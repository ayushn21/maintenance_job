module MaintenanceJob
  module EnsureNoPendingJobs
    extend ActiveSupport::Concern

    included do
      before_action :ensure_no_pending_maintenance_jobs
    end

    def ensure_no_pending_maintenance_jobs
      raise MaintenanceJob::PendingJobsError if MaintenanceJob::Base.pending_jobs.present?
    end
  end
end