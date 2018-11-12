require 'time'

module WebpageUpdateChecker
  module Ways
    class LastModified

      def initialize(uri:)
        @uri = uri
      end

      def current_diff_value
        page = Mechanize.new.get(@uri)
        Time.parse(page.header['last-modified'])
      end
    end
  end
end
