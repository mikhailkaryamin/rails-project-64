namespace :hexlet do
  desc "Linter ruby"
  task :slim_lint do
    RuboCop::RakeTask.new do |t|
      t.requires << "rubocop-rails"
    end
  end
end
