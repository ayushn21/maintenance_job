class ApplicationController < ActionController::Base
  include MaintenanceJob::EnsureNoPendingJobs
end
