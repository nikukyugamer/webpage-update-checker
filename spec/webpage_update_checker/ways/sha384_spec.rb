RSpec.describe WebpageUpdateChecker::Ways::Sha384 do
  describe '#current_diff_value' do
    let(:checker) { WebpageUpdateChecker::Ways::Sha384.new(uri: 'https://www.yahoo.co.jp/') }

    it 'returns SHA384 hash format' do
      expect(checker.current_diff_value).to match(/\A[a-f0-9]{96}\z/)
    end
  end
end
