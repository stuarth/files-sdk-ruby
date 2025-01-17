# frozen_string_literal: true

module Files
  class UsageSnapshot
    attr_reader :options, :attributes

    def initialize(attributes = {}, options = {})
      @attributes = attributes || {}
      @options = options || {}
    end

    # int64 - Usage snapshot ID
    def id
      @attributes[:id]
    end

    # date-time - Usage snapshot start date/time
    def start_at
      @attributes[:start_at]
    end

    # date-time - Usage snapshot end date/time
    def end_at
      @attributes[:end_at]
    end

    # date-time - DEPRECATED: Usage snapshot created at date/time
    def created_at
      @attributes[:created_at]
    end

    # double - Highest user count number in time period
    def high_water_user_count
      @attributes[:high_water_user_count]
    end

    # double - Current total Storage Usage GB as of end date (not necessarily high water mark, which is used for billing)
    def current_storage
      @attributes[:current_storage]
    end

    # double - Highest Storage Usage GB recorded in time period (used for billing)
    def high_water_storage
      @attributes[:high_water_storage]
    end

    # int64 - DEPRECATED: Number of downloads in report time period
    def total_downloads
      @attributes[:total_downloads]
    end

    # int64 - DEPRECATED: Number of uploads in time period
    def total_uploads
      @attributes[:total_uploads]
    end

    # date-time - DEPRECATED: The last time this site usage report was updated
    def updated_at
      @attributes[:updated_at]
    end

    # object - Storage Usage - map of root folders to their usage as of end date (not necessarily high water mark, which is used for billing)
    def usage_by_top_level_dir
      @attributes[:usage_by_top_level_dir]
    end

    # double - Storage Usage for root folder as of end date (not necessarily high water mark, which is used for billing)
    def root_storage
      @attributes[:root_storage]
    end

    # double - Storage Usage for files that are deleted but uploaded within last 30 days as of end date (not necessarily high water mark, which is used for billing)
    def deleted_files_counted_in_minimum
      @attributes[:deleted_files_counted_in_minimum]
    end

    # double - Storage Usage for files that are deleted but retained as backups as of end date (not necessarily high water mark, which is used for billing)
    def deleted_files_storage
      @attributes[:deleted_files_storage]
    end

    # double - Storage + Transfer Usage - Total Billable amount
    def total_billable_usage
      @attributes[:total_billable_usage]
    end

    # double - Transfer usage for period - Total Billable amount
    def total_billable_transfer_usage
      @attributes[:total_billable_transfer_usage]
    end

    # double - Transfer Usage for period - Outbound GB from Files Native Storage
    def bytes_sent
      @attributes[:bytes_sent]
    end

    # double - Transfer Usage for period - Inbound GB to Remote Servers (Sync/Mount)
    def sync_bytes_received
      @attributes[:sync_bytes_received]
    end

    # double - Transfer Usage for period - Outbound GB from Remote Servers (Sync/Mount)
    def sync_bytes_sent
      @attributes[:sync_bytes_sent]
    end

    # Parameters:
    #   cursor - string - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via either the X-Files-Cursor-Next header or the X-Files-Cursor-Prev header.
    #   per_page - int64 - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended).
    def self.list(params = {}, options = {})
      raise InvalidParameterError.new("Bad parameter: cursor must be an String") if params.dig(:cursor) and !params.dig(:cursor).is_a?(String)
      raise InvalidParameterError.new("Bad parameter: per_page must be an Integer") if params.dig(:per_page) and !params.dig(:per_page).is_a?(Integer)

      List.new(UsageSnapshot, params) do
        Api.send_request("/usage_snapshots", :get, params, options)
      end
    end

    def self.all(params = {}, options = {})
      list(params, options)
    end
  end
end
