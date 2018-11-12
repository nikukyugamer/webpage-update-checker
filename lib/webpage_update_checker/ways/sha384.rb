module WebpageUpdateChecker
  module Ways
    class Sha384
      def initialize(uri:)
        @uri = uri
      end

      def current_diff_value
        require 'digest/sha2'

        page = Mechanize.new.get(@uri)
        Digest::SHA384.hexdigest(page.body)
      end
    end
  end
end