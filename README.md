# MaintenanceJob

[![Tests](https://github.com/ayushn21/maintenance_job/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/ayushn21/maintenance_job/actions/workflows/tests.yml)
[![Gem Version](https://badge.fury.io/rb/maintenance_job.svg)](https://badge.fury.io/rb/maintenance_job)

`MaintenanceJob` is a lightweight Rails engine to run testable one-off jobs at deploy time to manipulate data in the database.

Theoretically this could be done in database migrations or rake tasks, but that's a terrible idea because the changes can't be tested. In the case of rake tasks, it would also require access to the prod environment to run the tasks which is not always feasible.

This gem was heavily inspired by [this RailsConf 2020 talk](https://railsconf.org/2020/2020/video/alec-clarke-measure-twice-cut-once) by [@alecclarke](https://github.com/alecclarke).

## Installation
Add this line to your Rails application's Gemfile:

```ruby
gem 'maintenance_job'
```

And then execute:

```bash
$ bundle install && bin/rails maintenance_job:install
```

This will copy the database migration that tracks which maintenance jobs have been run and create a directory under `app/jobs` for all your maintenance jobs.

## Usage

### Run maintenance jobs on deploy

Add `bin/rails maintenance_job:execute_pending_jobs` to your deploy script right after you run the database migrations.

### Creating a maintenance job

To create a new maintenance job, run:

```bash
$ bin/rails generate maintenance_job job_to_be_done
```

This will create two files:

- `app/jobs/maintenance/job_to_be_done_job.rb`
- `test/jobs/maintenance/job_to_be_done_job_test.rb`

Implement your data manipulation, write some tests for it and deploy!

### Ensuring all jobs have been run in local environments

If you'd like to ensure any pending maintenance jobs have been run in the development environment, add the following line to your `ApplicationController`:

`include MaintenanceJob::EnsureNoPendingJobs if Rails.env.development?`

If there are any pending jobs in development, the developer will see an actionable error in the browser where they can run the pending jobs and continue.

## Contributing

1. Fork it (https://github.com/ayushn21/maintenance_job/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
