require 'spec_helper'

repo = File.join(File.dirname(__FILE__), 'katip-sample-repo')

describe 'Tag system' do
  before do
    Dir.chdir repo
  end

  it 'creates the change log with the given tag range' do
    change_logger = Katip::ChangeLogger.new 'CHANGELOG.md', '0.1.0', '0.4.0'
    change_logger.log_changes

    original_file = Digest::MD5.file('../results/TagRangeLog.md').to_s
    result_file = Digest::MD5.file('CHANGELOG.md').to_s

    expect(result_file).to eq original_file
  end

  after do
    FileUtils.rm 'CHANGELOG.md' if File.exists? File.join(repo, 'CHANGELOG.md')
  end
end