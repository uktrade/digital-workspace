unless Rails.env.production?
  require 'rubocop/rake_task'
  require 'bundler/audit/task'

  RuboCop::RakeTask.new
  Bundler::Audit::Task.new

  task :ci do
    tasks = []
    tasks << :spec
    tasks << 'rubocop'
    tasks << 'bundle:audit'

    tasks.each do |task|
      Rake::Task[task].invoke
    end
  end
end
