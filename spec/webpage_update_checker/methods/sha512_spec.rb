RSpec.describe WebpageUpdateChecker::Methods::Sha512 do
  describe '#current_comparison_value' do
    let(:sha512) { WebpageUpdateChecker::Methods::Sha512.new(uri: 'https://www.yahoo.co.jp/') }

    it 'returns SHA512 hash format' do
      expect(sha512.current_comparison_value).to match(/\A[a-f0-9]{128}\z/)
    end
  end
end
