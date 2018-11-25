require 'time'

module WebpageUpdateChecker
  module Methods
    class LastModified

      def initialize(uri:)
        @uri = uri
      end

      def current_comparison_value
        page = Mechanize.new.get(@uri)
        page.header['last-modified'] ? Time.parse(page.header['last-modified']) : nil
      end
    end
  end
end
