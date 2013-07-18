namespace :katip do
  desc 'Create CHANGELOG.md'
  task :create => [:environment] do
    puts 'Create CHANGELOG.md'
    exec Katip.get
  end
end