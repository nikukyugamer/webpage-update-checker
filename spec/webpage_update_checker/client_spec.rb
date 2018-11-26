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

  describe '#current_diff_value' do
    it 'returns true if uri is valid' do
      obj = WebpageUpdateChecker::Methods::Md5.new(uri: 'https://www.yahoo.co.jp/')
      expect(@checker.current_diff_value(obj)).to be_truthy
    end

    it 'returns Exceotion if uri is invalid' do
      obj = WebpageUpdateChecker::Methods::Md5.new(uri: 'https://foobar/')
      expect { @checker.current_diff_value(obj) }.to raise_error(SocketError)
    end
  end

  describe '#updated?' do
    context 'when "previous_comparison_value" keyword argument is set' do
      context 'when the Methods are hash algorithm' do
        it 'return true if hash is different from previous one' do
          # TODO: Assumed this page's MD5 is not changed
          current_hash_object  = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
          previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d68'
          expect(@checker.updated?(current_hash_object, previous_comparison_value: previous_hash_value)).to eq true
        end

        it 'return false if hash is different from previous one' do
          # TODO: Assumed this page's MD5 is not changed
          current_hash_object  = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
          previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d67'
          expect(@checker.updated?(current_hash_object, previous_comparison_value: previous_hash_value)).to eq false
        end
      end

      context 'when the return type of the Methods is Time class' do
        # pending (skip)
      end

      context 'when the return type of the Methods is Integer class' do
        # pending (skip)
      end
    end

    context 'when "previous_diff_value" keyword argument is set' do
      context 'when the Methods are hash algorithm' do
        it 'return true if hash is different from previous one' do
          # TODO: Assumed this page's MD5 is not changed
          current_hash_object  = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
          previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d68'
          expect(@checker.updated?(current_hash_object, previous_diff_value: previous_hash_value)).to eq true
        end

        it 'return false if hash is different from previous one' do
          # TODO: Assumed this page's MD5 is not changed
          current_hash_object  = WebpageUpdateChecker::Methods::Md5.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
          previous_hash_value = 'fb2eeb524e6b5637ef7fa4bed48f1d67'
          expect(@checker.updated?(current_hash_object, previous_diff_value: previous_hash_value)).to eq false
        end
      end

      context 'when the return type of the Methods is Time class' do
        # pending (skip)
      end

      context 'when the return type of the Methods is Integer class' do
        # pending (skip)
      end
    end
  end

  describe '#lazy_time_updated?' do
    context 'when comparision values with lazy_seconds are the same' do
      it 'return false' do
        # 2008-03-18 01:05:01 +0900
        current_time_object = WebpageUpdateChecker::Methods::LastModified.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
        previous_comparision_value = '2008-03-18 01:00:01 +0900'
        lazy_seconds = 60 * 5

        expect(@checker.lazy_time_updated?(current_time_object, previous_comparison_value: previous_comparision_value, lazy_seconds: lazy_seconds)).to eq false
      end
    end

    context 'when comparision values with lazy_seconds are different' do
      it 'return true' do
        # 2008-03-18 01:05:01 +0900
        current_time_object = WebpageUpdateChecker::Methods::LastModified.new(uri: 'http://www.ne.jp/asahi/pursuits/ootsuki/pc/X68k/x680x0.xhtml')
        previous_comparision_value = '2008-03-18 01:00:00 +0900'
        lazy_seconds = 60 * 5

        expect(@checker.lazy_time_updated?(current_time_object, previous_comparison_value: previous_comparision_value, lazy_seconds: lazy_seconds)).to eq true
      end
    end
  end
end
