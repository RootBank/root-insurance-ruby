class Root::Insurance::Client
  module Policy
    def issue_policy(application_id:)
      data = {
        application_id: application_id,
      }

      post(:policies, data)
    end

    def add_policy_beneficiary(policy_id:, id:, first_name:, last_name:, percentage:)
      raise ArgumentError.new('id needs to be a hash') unless id.is_a? Hash

      data = {
        id:         id,
        first_name: first_name,
        last_name:  last_name,
        percentage: percentage
      }

      put("policies/#{policy_id}/beneficiaries", data)
    end

    def list_policies
      get(:policies)
    end

    def get_policy(id:)
      get("policies/#{id}")
    end

    def cancel_policy(id:, reason:)
      data = {reason: reason}

      post("policies/#{id}/cancel", data)
    end

    def replace_policy(id:, quote_package_id:)
      data = {quote_package_id: quote_package_id}

      post("policies/#{id}/replace", data)
    end

    def update_policy_billing_amount(id:, billing_amount:)
      data = {billing_amount: billing_amount}

      post("policies/#{id}/billing_amount", data)
    end

    def get_policy_beneficiaries(id:)
      get("policies/#{id}/beneficiaries")
    end
  end
end
