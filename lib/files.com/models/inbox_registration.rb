# frozen_string_literal: true

module Files
  class InboxRegistration
    attr_reader :options, :attributes

    def initialize(attributes = {}, options = {})
      @attributes = attributes || {}
      @options = options || {}
    end

    # string - Registration cookie code
    def code
      @attributes[:code]
    end

    # string - Registrant name
    def name
      @attributes[:name]
    end

    # string - Registrant company name
    def company
      @attributes[:company]
    end

    # string - Registrant email address
    def email
      @attributes[:email]
    end

    # string - Clickwrap text that was shown to the registrant
    def clickwrap_body
      @attributes[:clickwrap_body]
    end

    # int64 - Id of associated form field set
    def form_field_set_id
      @attributes[:form_field_set_id]
    end

    # object - Data for form field set with form field ids as keys and user data as values
    def form_field_data
      @attributes[:form_field_data]
    end

    # int64 - Id of associated inbox
    def inbox_id
      @attributes[:inbox_id]
    end

    # int64 - Id of associated inbox recipient
    def inbox_recipient_id
      @attributes[:inbox_recipient_id]
    end

    # string - Title of associated inbox
    def inbox_title
      @attributes[:inbox_title]
    end

    # Parameters:
    #   cursor - string - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via either the X-Files-Cursor-Next header or the X-Files-Cursor-Prev header.
    #   per_page - int64 - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended).
    #   folder_behavior_id - int64 - ID of the associated Inbox.
    def self.list(params = {}, options = {})
      raise InvalidParameterError.new("Bad parameter: cursor must be an String") if params.dig(:cursor) and !params.dig(:cursor).is_a?(String)
      raise InvalidParameterError.new("Bad parameter: per_page must be an Integer") if params.dig(:per_page) and !params.dig(:per_page).is_a?(Integer)
      raise InvalidParameterError.new("Bad parameter: folder_behavior_id must be an Integer") if params.dig(:folder_behavior_id) and !params.dig(:folder_behavior_id).is_a?(Integer)

      List.new(InboxRegistration, params) do
        Api.send_request("/inbox_registrations", :get, params, options)
      end
    end

    def self.all(params = {}, options = {})
      list(params, options)
    end
  end
end
