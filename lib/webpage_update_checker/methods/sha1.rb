module WebpageUpdateChecker
  module Methods
    class Sha1
      def initialize(uri:)
        @uri = uri
      end

      def current_comparison_value
        require 'digest/sha1'

        page = Mechanize.new.get(@uri)
        Digest::SHA1.hexdigest(page.body)
      end
    end
  end
end
