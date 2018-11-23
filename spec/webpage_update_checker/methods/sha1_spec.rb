RSpec.describe WebpageUpdateChecker::Methods::Sha1 do
  describe '#current_comparison_value' do
    let(:sha1) { WebpageUpdateChecker::Methods::Sha1.new(uri: 'https://www.yahoo.co.jp/') }

    it 'returns SHA1 hash format' do
      expect(sha1.current_comparison_value).to match(/\A[a-f0-9]{40}\z/)
    end
  end
end
