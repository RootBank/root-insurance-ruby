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
  end
end
