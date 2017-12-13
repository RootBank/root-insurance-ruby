describe Root::Insurance::Client::Quote do
  let(:base_url) { "https://sandbox.root.co.za/v1/insurance" }
  let(:url) { "#{base_url}/quotes" }

  let(:app_id)      { 'app_id' }
  let(:app_secret)  { 'app_secret' }
  let(:environment) { :sandbox }

  let(:client) { Root::Insurance::Client.new(app_id, app_id, environment) }

  describe :create_quote do
    context "without a model name" do
      it "posts to the correct data to the correct url" do
        stub_request(:post, url)
          .with(body: {type: "root_gadgets"})
          .to_return(body: "{}")

        client.create_quote(type: "root_gadgets")
      end
    end

    context "with a model name" do
      let(:type) { "root_gadgets" }
      let(:model_name) { "iPhone 6s 64GB LTE" }

      it "posts to the correct data to the correct url" do
        stub_request(:post, url)
          .with(body: {type: type, model_name: model_name})
          .to_return(body: "{}")

        client.create_quote(type: type, model_name: model_name)
      end
    end
  end

  describe :list_gadget_models do
    let(:url) { "#{base_url}/gadgets/models" }
    it "gets from the correct url" do
        stub_request(:get, url)
          .to_return(body: "{}")

        client.list_gadget_models
      end
  end
end
