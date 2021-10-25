Rails.application.routes.draw do
  mount MaintenanceJob::Engine => "/maintenance_job"

  get "test_no_pending_jobs", to: "test#show"
end
