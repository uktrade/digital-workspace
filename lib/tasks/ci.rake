# frozen_string_literal: true

unless Rails.env.production?
  require 'rubocop/rake_task'
  require 'bundler/audit/task'

  RuboCop::RakeTask.new
  Bundler::Audit::Task.new

  task :ci do
    tasks = %w[spec rubocop audit_with_ignore]

    tasks.each do |task|
      Rake::Task[task].invoke
    end
  end

  task :audit_with_ignore do
    # The Rake task doesn't allow specifying ignored vulnerabilities,
    # so we need to call `bundle audit` manually.

    ignored_vulnerablilties = [
      # does not affect DW as DW accounts are linked 1-to-1 to SSO
      'CVE-2015-9284'
    ].join(' ')
    system("bundle audit check --update --ignore=#{ignored_vulnerablilties}")
  end
end
