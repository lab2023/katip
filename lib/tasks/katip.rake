namespace :katip do
  desc 'Create CHANGELOG.md'
  task :create => [:environment] do

    file_name = ENV['file'] || 'CHANGELOG.md'

    exec Katip.get_file(file_name)

  end
end