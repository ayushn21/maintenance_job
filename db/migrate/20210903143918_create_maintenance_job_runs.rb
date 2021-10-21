class CreateMaintenanceRuns < ActiveRecord::Migration[6.1]
  def change
    create_table :maintenance_job_runs, id: :string, primary_key: :identifier
  end
end
