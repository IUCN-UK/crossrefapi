# frozen_string_literal: true

require "net/http"
require "json"

require_relative "crossrefapi/client"
require_relative "crossrefapi/funders"
require_relative "crossrefapi/journals"
require_relative "crossrefapi/licenses"
require_relative "crossrefapi/members"
require_relative "crossrefapi/prefixes"
require_relative "crossrefapi/types"
require_relative "crossrefapi/version"
require_relative "crossrefapi/works"

module Crossrefapi
  class Error < StandardError; end
end
