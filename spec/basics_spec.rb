require 'spec_helper'
require 'digest'

repo = File.join(File.dirname(__FILE__), 'katip-sample-repo')

describe 'Katip application' do
  before do
    Dir.chdir repo
  end

  it 'creates the change log with default name' do
    change_logger = Katip::ChangeLogger.new
    change_logger.log_changes
    expect(File.exists?('CHANGELOG.md')).to be true
  end

  it 'creates the change log with given name' do
    change_logger = Katip::ChangeLogger.new 'SampleChangeLog.md'
    change_logger.log_changes
    expect(File.exists?('SampleChangeLog.md')).to be true
  end

  it 'creates the change log files properly' do
    change_logger = Katip::ChangeLogger.new
    change_logger.log_changes

    original_file = Digest::MD5.file('../results/CHANGELOG.md').to_s
    result_file = Digest::MD5.file('CHANGELOG.md').to_s

    expect(result_file).to eq original_file
  end

  it 'creates the change log files properly with different name' do
    change_logger = Katip::ChangeLogger.new 'MyChangelog.md'
    change_logger.log_changes

    original_file = Digest::MD5.file('../results/MyChangelog.md').to_s
    result_file = Digest::MD5.file('MyChangelog.md').to_s

    expect(result_file).to eq original_file
  end


  after do
    FileUtils.rm 'CHANGELOG.md' if File.exists?('CHANGELOG.md')
    FileUtils.rm 'SampleChangeLog.md' if File.exists?('SampleChangeLog.md')
    FileUtils.rm 'MyChangelog.md' if File.exists?('MyChangelog.md')
  end
end