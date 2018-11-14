RSpec.describe WebpageUpdateChecker::Methods::HttpStatusCode do
  describe '#current_diff_value' do
    it 'returns 200' do
      checker = WebpageUpdateChecker::Methods::HttpStatusCode.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
      expect(checker.current_diff_value).to eq(200) # NOT 200 if this webpage removes
    end

    it 'returns 404' do
      checker = WebpageUpdateChecker::Methods::HttpStatusCode.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x68030.xhtml')
      expect(checker.current_diff_value).to eq(404)
    end
  end
end
