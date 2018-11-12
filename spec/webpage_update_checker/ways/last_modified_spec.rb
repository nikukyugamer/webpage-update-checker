RSpec.describe WebpageUpdateChecker::Ways::LastModified do
  describe '#current_diff_value' do

    it 'returns Last-Modified if the page has Last-Modified header' do
      checker = WebpageUpdateChecker::Ways::LastModified.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
      expect(checker.current_diff_value.is_a?(Time)).to match(true)
    end

    it 'returns nil if the page does not have Last-Modified header' do
      checker = WebpageUpdateChecker::Ways::LastModified.new(uri: 'https://www.aiseikai.or.jp/')
      expect(checker.current_diff_value).to match(nil)
    end
  end
end
