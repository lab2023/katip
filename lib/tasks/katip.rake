namespace :katip do
  desc 'Create change log'
  task :create => [:environment] do

    file_name = ENV['file'] || 'CHANGELOG.md'

    change_logger = Katip::ChangeLogger.new(file_name)

    change_logger.log_changes
  end
end