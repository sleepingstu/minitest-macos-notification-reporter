# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"
require "minitest/fail_fast"
require "minitest/macos_notification"
require "minitest/reporters"

Minitest::Reporters.use!(
  [
    Minitest::Reporters::SpecReporter.new,
    Minitest::Reporters::MacosNotificationReporter.new(title: "macOS Notification Reporter")
  ],
  ENV,
  Minitest.backtrace_filter
)
