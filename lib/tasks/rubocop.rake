# frozen_string_literal: true

namespace :hexlet do
  desc 'Linter ruby'
  task slim_lint: :environment do
    RuboCop::RakeTask.new do |t|
      t.requires << 'rubocop-rails'
    end
  end
end
