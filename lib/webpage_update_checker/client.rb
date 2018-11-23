require 'mechanize'
Dir[File.expand_path('methods', __dir__) << '/*.rb'].each { |file| require file }

module WebpageUpdateChecker
  class Client
    def updated?(checked_object, previous_comparison_value:, previous_diff_value: nil)
      if previous_comparison_value.nil?
        # Deprecated keyword argument
        current_comparison_value(checked_object) != previous_diff_value
      else
        current_comparison_value(checked_object) != previous_comparison_value
      end
    end

    def current_comparison_value(checked_object)
      checked_object.current_comparison_value
    end

    # Depricated method
    def current_diff_value(checked_object)
      current_comparison_value(checked_object)
    end
  end
end
