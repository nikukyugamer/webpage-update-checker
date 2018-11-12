RSpec.describe WebpageUpdateChecker::Ways::Sha256 do
  describe '#current_diff_value' do
    let(:checker) { WebpageUpdateChecker::Ways::Sha256.new(uri: 'https://www.yahoo.co.jp/') }

    it 'returns SHA256 hash format' do
      expect(checker.current_diff_value).to match(/\A[a-f0-9]{64}\z/)
    end
  end
end
