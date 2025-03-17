# frozen_string_literal: true

require "net/http"
require "json"

require_relative "crossrefapi/version"
require_relative "crossrefapi/client"
require_relative "crossrefapi/works"

module Crossrefapi
  class Error < StandardError; end
end
