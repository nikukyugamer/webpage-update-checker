RSpec.describe WebpageUpdateChecker::Methods::Md5 do
  describe '#current_comparison_value' do
    let(:md5) { WebpageUpdateChecker::Methods::Md5.new(uri: 'https://www.yahoo.co.jp/') }

    it 'returns MD5 hash format' do
      expect(md5.current_comparison_value).to match(/\A[a-f0-9]{32}\z/)
    end
  end
end
