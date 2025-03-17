# frozen_string_literal: true

require "net/http"
require "json"

require_relative "crossrefapi/version"
require_relative "crossrefapi/client"

module Crossrefapi
  class Error < StandardError; end
  # Your code goes here...
end
