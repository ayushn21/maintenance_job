module MaintenanceJob
  class Engine < ::Rails::Engine
    isolate_namespace MaintenanceJob

    initializer "maintenance_job.eager_load_namespace" do
      Rails.autoloaders.main.on_setup do
        Maintenance.constants(false).each { |cname| Maintenance.const_get(cname) }
      end
    end
  end
end
