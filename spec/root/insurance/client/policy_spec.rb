describe Root::Insurance::Client::Policy do
  let(:base_url) { "https://sandbox.root.co.za/v1/insurance" }
  let(:url) { "#{base_url}/policies" }

  let(:app_id)      { 'app_id' }
  let(:app_secret)  { 'app_secret' }
  let(:environment) { :sandbox }

  let(:client) { Root::Insurance::Client.new(app_id, app_id, environment) }

  let(:policy_id) { "128ba0c0-3f6a-4f8b-9b40-e2066b02b59e" }

  describe :issue_policy do
    let(:application_id) { "bf1ada91-eecb-4f47-9bfa-1258bb1e0055" }

    it "posts to the correct url" do
      stub_request(:post, url)
        .with(body: {application_id: application_id})
        .to_return(body: "{}")

      client.issue_policy(application_id: application_id)
    end
  end

  describe :add_policy_beneficiary do
    let(:id_obj) { {type: 'id', number: '8704094800082', country: 'ZA'} }
    let(:first_name) { "Jared" }
    let(:last_name)  {"Dunn"}
    let(:percentage) { 100 }

    let(:update_url) { "#{url}/#{policy_id}/beneficiaries" }

    let(:expected_body) do
      {
        id:         id_obj,
        first_name: first_name,
        last_name:  last_name,
        percentage: percentage
      }
    end

    it "puts to the correct url" do
      stub_request(:put, update_url)
        .with(body: expected_body)
        .to_return(body: "{}")

      client.add_policy_beneficiary(
        policy_id: "128ba0c0-3f6a-4f8b-9b40-e2066b02b59e",
        id: {type: 'id', number: '8704094800082', country: 'ZA'},
        first_name: "Jared",
        last_name:  "Dunn",
        percentage: 100)
    end
  end

  describe :list_policies do
    it "gets from the correct url" do
      stub_request(:get, url)
        .to_return(body: "{}")

      client.list_policies
    end
  end

  describe :get_policy do
    let(:get_url) { "#{url}/#{policy_id}" }

    it "gets from the correct url" do
      stub_request(:get, get_url)
        .to_return(body: "{}")

      client.get_policy(id: policy_id)
    end
  end

  describe :cancel_policy do
    let(:cancel_url) { "#{url}/#{policy_id}/cancel" }
    let(:reason) { "No longer needed" }

    it "posts to the correct url" do
      stub_request(:post, cancel_url)
        .with(body: {reason: reason})
        .to_return(body: "{}")

      client.cancel_policy(id: policy_id, reason: reason)
    end
  end

  describe :replace_policy do
    let(:quote_package_id) { "8b922b9d-e874-4b06-87d0-e1f16a2d57db" }
    let(:replace_url) { "#{url}/#{policy_id}/replace" }

    it "posts to the correct url" do
      stub_request(:post, replace_url)
        .with(body: {quote_package_id: quote_package_id})
        .to_return(body: "{}")

      client.replace_policy(id: policy_id, quote_package_id: quote_package_id)
    end
  end

  describe :update_policy_billing_amount do
    let(:billing_amount) { 45000 }
    let(:update_url) { "#{url}/#{policy_id}/billing_amount" }

    it "posts to the correct url" do
      stub_request(:post, update_url)
        .with(body: {billing_amount: billing_amount})
        .to_return(body: "{}")

      client.update_policy_billing_amount(
        id:             policy_id,
        billing_amount: billing_amount)
    end
  end

  describe :list_policy_beneficiaries do
    let(:get_url) { "#{url}/#{policy_id}/beneficiaries" }

    it "gets from the correct url" do
      stub_request(:get, get_url)
        .to_return(body: "{}")

      client.list_policy_beneficiaries(id: policy_id)
    end
  end

  describe :list_policy_events do
    let(:get_url) { "#{url}/#{policy_id}/events" }

    it "gets from the correct url" do
      stub_request(:get, get_url)
        .to_return(body: "{}")

      client.list_policy_events(id: policy_id)
    end
  end

end
