require "slim_lint/rake_task"

namespace :hexlet do
  desc "Linter views"
  task :slim_lint do |t, args|
    SlimLint::RakeTask.new
  end
end
