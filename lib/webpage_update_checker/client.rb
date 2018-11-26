require 'mechanize'
require 'active_support'
require 'active_support/core_ext'
Dir[File.expand_path('methods', __dir__) << '/*.rb'].each { |file| require file }

module WebpageUpdateChecker
  class Client
    def updated?(checked_object, previous_comparison_value: nil, previous_diff_value: nil)
      if previous_comparison_value.nil?
        # Deprecated keyword argument
        current_comparison_value(checked_object) != previous_diff_value
      else
        current_comparison_value(checked_object) != previous_comparison_value
      end
    end

    def lazy_time_updated?(checked_object, previous_comparison_value:, lazy_seconds:)
      corrected_previous_comparison_value_time_class = (Time.parse(previous_comparison_value) + lazy_seconds.seconds).utc
      checked_object_time_class = current_comparison_value(checked_object).utc

      checked_object_time_class > corrected_previous_comparison_value_time_class
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
