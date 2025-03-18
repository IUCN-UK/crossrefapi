# frozen_string_literal: true

require "net/http"
require "json"

require_relative "crossrefapi/version"
require_relative "crossrefapi/client"
require_relative "crossrefapi/works"
require_relative "crossrefapi/prefixes"
require_relative "crossrefapi/licenses"

module Crossrefapi
  class Error < StandardError; end
end
