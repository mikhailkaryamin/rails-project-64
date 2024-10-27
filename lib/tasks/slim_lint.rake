# frozen_string_literal: true

require 'slim_lint/rake_task'

namespace :hexlet do
  desc 'Linter views'
  task slim_lint: :environment do |_t, _args|
    SlimLint::RakeTask.new
  end
end
