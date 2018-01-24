describe Root::Insurance::Client::Application do
  let(:base_url) { "https://sandbox.root.co.za/v1/insurance" }
  let(:url) { "#{base_url}/applications" }

  let(:app_id)      { 'app_id' }
  let(:app_secret)  { 'app_secret' }
  let(:environment) { :sandbox }

  let(:client) { Root::Insurance::Client.new(app_id, app_secret, environment) }

  describe :create_application do
    let(:expected_body) do
      {
        policyholder_id:  "bf1ada91-eecb-4f47-9bfa-1258bb1e0055",
        quote_package_id: "f4397823-db4a-4d6a-a06b-08e1a2a3172c",
        monthly_premium:  50000,
        serial_number:    "1234567890"
      }
    end

    it "posts the correct data to the correct endpoint" do
      stub_request(:post, url)
        .with(body: expected_body)
        .to_return(body: "{}")

      client.create_application(
        policyholder_id:  "bf1ada91-eecb-4f47-9bfa-1258bb1e0055",
        quote_package_id: "f4397823-db4a-4d6a-a06b-08e1a2a3172c",
        monthly_premium:  50000,
        serial_number:    "1234567890")
    end
  end

end
