require 'time'

module WebpageUpdateChecker
  module Ways
    class LastModified

      def initialize(uri:)
        @uri = uri
      end

      def current_diff_value
        page = Mechanize.new.get(@uri)
        page.header['last-modified'] ? Time.parse(page.header['last-modified']) : nil
      end
    end
  end
end