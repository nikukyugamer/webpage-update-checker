module WebpageUpdateChecker
  module Ways
    class Sha512
      def initialize(uri:)
        @uri = uri
      end

      def current_diff_value
        require 'digest/sha2'

        page = Mechanize.new.get(@uri)
        Digest::SHA512.hexdigest(page.body)
      end
    end
  end
end