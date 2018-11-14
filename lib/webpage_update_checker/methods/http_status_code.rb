module WebpageUpdateChecker
  module Methods
    class HttpStatusCode
      def initialize(uri:)
        @uri = uri
      end

      def current_diff_value
        page = Mechanize.new.get(@uri)
        page.code.to_i
      rescue Mechanize::ResponseCodeError => e
        e.response_code.to_i
      end
    end
  end
end