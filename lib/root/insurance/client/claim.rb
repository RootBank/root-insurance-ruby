class Root::Insurance::Client
  module Claim
    def list_claims(status: nil, approval: nil)
      query = {
        claim_status:    status,
        approval_status: approval
      }

      get(:claims, query)
    end

    def get_claim(id:)
      get("claims/#{id}")
    end

    def open_claim(policy_id: nil, policy_holder_id: nil)
      data = {
        policy_id:        policy_id,
        policy_holder_id: policy_holder_id
      }

      post(:claims, data)
    end

    def link_policy_to_claim(claim_id:, policy_id:)
      data = {policy_id: policy_id}

      post("claims/#{claim_id}/policy", data)
    end

    def link_policyholder_to_claim(claim_id:, policyholder_id:)
      data = {policyholder_id: policyholder_id}

      post("claims/#{claim_id}/policyholder", data)
    end

  end
end
