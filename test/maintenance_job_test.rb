require "test_helper"

class MaintenanceJobTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert MaintenanceJob::VERSION
  end
end
