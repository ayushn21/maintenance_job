Rails.application.routes.draw do
  mount MaintenanceJob::Engine => "/maintenance_job"
end
