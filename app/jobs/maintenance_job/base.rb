module MaintenanceJob
  class Base < ActiveJob::Base
    queue_as :default
    discard_on ActiveRecord::RecordNotUnique
    discard_on ActiveJob::DeserializationError

    before_perform { self.class.record_run }

    def perform
      raise NotImplementedError
    end

    def self.record_run
      Run.create(identifier: identifier)
    end

    def self.runnable?
      Run.find_by(identifier: identifier).nil?
    end

    def self.pending_jobs
      descendants.select(&:runnable?)
    end

    def self.run_pending_jobs
      pending_jobs.each(&:perform_now)
    end

    def self.identifier
      raise NotImplementedError
    end
  end
end
