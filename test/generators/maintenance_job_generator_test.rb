require "test_helper"

class MaintenanceJob::GeneratorTest < Rails::Generators::TestCase
  destination File.expand_path("../../tmp", __dir__)
  setup :prepare_destination
  tests MaintenanceJob::Generator


end