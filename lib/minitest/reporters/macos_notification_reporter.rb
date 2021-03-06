# frozen_string_literal: true

require "minitest/reporters"
require "os"
require "terminal-notifier"

module Minitest
  module Reporters
    class MacosNotificationReporter < BaseReporter
      def report
        super
        show_notification if OS.mac?
      end

      private

      def show_notification
        text = "#{total_count} tests, #{failures} failures, #{errors} errors, #{skips} skips in #{total_time}"
        title = options[:title] || "Minitest"
        subtitle = (passed? ? "\u{1F49A} Success" : "\u{1F494} Failed")
        group = title.downcase.tr(" ", "-")

        TerminalNotifier.notify(text, title: title, subtitle: subtitle, group: group)
      end
    end
  end
end
