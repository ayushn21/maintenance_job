module MaintenanceJob
  class Engine < ::Rails::Engine
    isolate_namespace MaintenanceJob

    initializer "maintenance_job.eager_load_namespace" do
      autoloader = Rails.autoloaders.main
      if autoloader.respond_to?(:on_setup)
        autoloader.on_setup do
          Maintenance.constants(false).each { |cname| Maintenance.const_get(cname) }
        end
      else
        autoloader.preload(Rails.root.join("app", "jobs", "maintenance"))
      end
    end
  end
end
