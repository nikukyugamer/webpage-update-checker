RSpec.describe WebpageUpdateChecker::Client do
  before do
    @checker = WebpageUpdateChecker::Client.new
  end

  describe '#current_comparison_value' do
    it 'returns true if uri is valid' do
      obj = WebpageUpdateChecker::Methods::Md5.new(uri: 'https://www.yahoo.co.jp/')
      expect(@checker.current_comparison_value(obj)).to be_truthy
    end

    it 'returns Exceotion if uri is invalid' do
      obj = WebpageUpdateChecker::Methods::Md5.new(uri: 'https://foobar/')
      expect { @checker.current_comparison_value(obj) }.to raise_error(SocketError)
    end
  end

  describe '#updated?' do
    context 'when the Methods are hash algorithm' do
      it 'return true if hash is different from previous one' do
        # TODO: Assumed this page's MD5 is not changed
        current_hash_value  = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
        previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d68'
        expect(@checker.updated?(current_hash_value, previous_comparison_value: previous_hash_value)).to eq true
      end

      it 'return false if hash is different from previous one' do
        # TODO: Assumed this page's MD5 is not changed
        current_hash_value  = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
        previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d67'
        expect(@checker.updated?(current_hash_value, previous_comparison_value: previous_hash_value)).to eq false
      end
    end
  end
end
