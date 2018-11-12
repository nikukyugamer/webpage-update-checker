RSpec.describe WebpageUpdateChecker::Judge do
  describe '#current_diff_value' do
    let(:checker) { WebpageUpdateChecker::Judge.new }

    context 'when the way is MD5' do
      it 'returns true if uri is valid' do
        obj = WebpageUpdateChecker::Ways::Md5.new(uri: 'https://www.yahoo.co.jp/')
        expect(checker.current_diff_value(obj)).to be_truthy
      end

      it 'returns Exceotion if uri is invalid' do
        obj = WebpageUpdateChecker::Ways::Md5.new(uri: 'https://foobar/')
        expect{ checker.current_diff_value(obj) }.to raise_error(SocketError)
      end
    end

    context 'when the way is MD5' do
      it 'returns true if uri is valid' do
        obj = WebpageUpdateChecker::Ways::Md5.new(uri: 'https://www.yahoo.co.jp/')
        expect(checker.current_diff_value(obj)).to be_truthy
      end

      it 'returns Exceotion if uri is invalid' do
        obj = WebpageUpdateChecker::Ways::Md5.new(uri: 'https://foobar/')
        expect{ checker.current_diff_value(obj) }.to raise_error(SocketError)
      end
    end

    context 'when the way is SHA256' do
      it 'returns true if uri is valid' do
        obj = WebpageUpdateChecker::Ways::Sha256.new(uri: 'https://www.yahoo.co.jp/')
        expect(checker.current_diff_value(obj)).to be_truthy
      end

      it 'returns Exceotion if uri is invalid' do
        obj = WebpageUpdateChecker::Ways::Sha256.new(uri: 'https://foobar/')
        expect{ checker.current_diff_value(obj) }.to raise_error(SocketError)
      end
    end

    context 'when the way is SHA384' do
      it 'returns true if uri is valid' do
        obj = WebpageUpdateChecker::Ways::Sha384.new(uri: 'https://www.yahoo.co.jp/')
        expect(checker.current_diff_value(obj)).to be_truthy
      end

      it 'returns Exceotion if uri is invalid' do
        obj = WebpageUpdateChecker::Ways::Sha384.new(uri: 'https://foobar/')
        expect{ checker.current_diff_value(obj) }.to raise_error(SocketError)
      end
    end

    context 'when the way is SHA512' do
      it 'returns true if uri is valid' do
        obj = WebpageUpdateChecker::Ways::Sha512.new(uri: 'https://www.yahoo.co.jp/')
        expect(checker.current_diff_value(obj)).to be_truthy
      end

      it 'returns Exceotion if uri is invalid' do
        obj = WebpageUpdateChecker::Ways::Sha512.new(uri: 'https://foobar/')
        expect{ checker.current_diff_value(obj) }.to raise_error(SocketError)
      end
    end

    context 'when the way is Last-Modified' do
      # TODO: These are duplicated test codes... (spec/webpage_update_checker/ways/*)
      it 'returns true if uri is valid and uri has Last-Modified header' do
        obj = WebpageUpdateChecker::Ways::LastModified.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
        expect(checker.current_diff_value(obj)).to be_truthy
      end

      it 'returns nil if uri is valid and uri does not have Last-Modified header' do
        obj = WebpageUpdateChecker::Ways::LastModified.new(uri: 'https://www.aiseikai.or.jp/')
        expect(checker.current_diff_value(obj)).to eq nil
      end

      it 'returns Exceotion if uri is invalid' do
        obj = WebpageUpdateChecker::Ways::LastModified.new(uri: 'https://foobar/')
        expect{ checker.current_diff_value(obj) }.to raise_error(SocketError)
      end
    end
  end

  describe '#updated?' do
    let(:checker) { WebpageUpdateChecker::Judge.new }

    context 'when the ways are hash algorithm' do
      it 'return true if hash is different from previous one' do
        # TODO: Assumed this page's MD5 is not changed
        current_hash_value  = WebpageUpdateChecker::Ways::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
        previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d68'
        expect(checker.updated?(current_hash_value, previous_diff_value: previous_hash_value)).to eq true
      end

      it 'return false if hash is different from previous one' do
        # TODO: Assumed this page's MD5 is not changed
        current_hash_value  = WebpageUpdateChecker::Ways::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
        previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d67'
        expect(checker.updated?(current_hash_value, previous_diff_value: previous_hash_value)).to eq false
      end
    end
  end
end
