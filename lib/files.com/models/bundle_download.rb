# frozen_string_literal: true

module Files
  class BundleDownload
    attr_reader :options, :attributes

    def initialize(attributes = {}, options = {})
      @attributes = attributes || {}
      @options = options || {}
    end

    def bundle_registration
      @attributes[:bundle_registration]
    end

    # string - Download method (file or full_zip)
    def download_method
      @attributes[:download_method]
    end

    # string - Download path This must be slash-delimited, but it must neither start nor end with a slash. Maximum of 5000 characters.
    def path
      @attributes[:path]
    end

    # date-time - Download date/time
    def created_at
      @attributes[:created_at]
    end

    # Parameters:
    #   cursor - string - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header.
    #   per_page - int64 - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended).
    #   bundle_id - int64 - Bundle ID
    #   bundle_registration_id - int64 - BundleRegistration ID
    def self.list(params = {}, options = {})
      raise InvalidParameterError.new("Bad parameter: cursor must be an String") if params.dig(:cursor) and !params.dig(:cursor).is_a?(String)
      raise InvalidParameterError.new("Bad parameter: per_page must be an Integer") if params.dig(:per_page) and !params.dig(:per_page).is_a?(Integer)
      raise InvalidParameterError.new("Bad parameter: bundle_id must be an Integer") if params.dig(:bundle_id) and !params.dig(:bundle_id).is_a?(Integer)
      raise InvalidParameterError.new("Bad parameter: bundle_registration_id must be an Integer") if params.dig(:bundle_registration_id) and !params.dig(:bundle_registration_id).is_a?(Integer)

      List.new(BundleDownload, params) do
        Api.send_request("/bundle_downloads", :get, params, options)
      end
    end

    def self.all(params = {}, options = {})
      list(params, options)
    end
  end
end
