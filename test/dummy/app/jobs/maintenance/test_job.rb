module Maintenance
  class TestJob < MaintenanceJob::Base
    cattr_accessor :count, default: 0

    def perform
      self.class.count += 1
    end

    def self.identifier
      "test"
    end
  end
end
