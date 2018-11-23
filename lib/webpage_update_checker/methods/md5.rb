module WebpageUpdateChecker
  module Methods
    class Md5
      def initialize(uri:)
        @uri = uri
      end

      def current_comparison_value
        require 'digest/md5'

        page = Mechanize.new.get(@uri)
        Digest::MD5.hexdigest(page.body)
      end
    end
  end
end