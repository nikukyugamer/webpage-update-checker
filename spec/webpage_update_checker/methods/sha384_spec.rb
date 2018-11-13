RSpec.describe WebpageUpdateChecker::Methods::Sha384 do
  describe '#current_diff_value' do
    let(:sha384) { WebpageUpdateChecker::Methods::Sha384.new(uri: 'https://www.yahoo.co.jp/') }

    it 'returns SHA384 hash format' do
      expect(sha384.current_diff_value).to match(/\A[a-f0-9]{96}\z/)
    end
  end
end
