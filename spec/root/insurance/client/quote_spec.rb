describe Root::Insurance::Client::Quote do
  let(:base_url) { "https://sandbox.root.co.za/v1/insurance" }
  let(:url) { "#{base_url}/quotes" }

  let(:app_id)      { 'app_id' }
  let(:app_secret)  { 'app_secret' }
  let(:environment) { :sandbox }

  let(:client) { Root::Insurance::Client.new(app_id, app_secret, environment) }

  describe :create_quote do
    context "root gadgets" do
      let(:type) { "root_gadgets" }
      let(:model_name) { "iPhone 6s 64GB LTE" }

      it "posts to the correct data to the correct url" do
        stub_request(:post, url)
          .with(body: {type: type, model_name: model_name})
          .to_return(body: "{}")

        client.create_quote(type: type, model_name: model_name)
      end
    end

    context "term cover" do |variable|
      let(:type) { "root_term" }
      let(:cover_amount) { 100_000_00 }
      let(:cover_period) { 'one_year' }
      let(:basic_income_per_month) { 20_000_00 }
      let(:education_status) { 'grade_12_matric' }
      let(:smoker) { true }
      let(:gender) { 'male' }
      let(:age) { 31 }

      let(:expected_data) do
        {
          type: type,
          cover_amount: cover_amount,
          cover_period: cover_period,
          basic_income_per_month: basic_income_per_month,
          education_status: education_status,
          smoker: smoker,
          gender: gender,
          age:    age
        }
      end

      it "posts to the correct data to the correct url" do
        stub_request(:post, url)
          .with(body: expected_data)
          .to_return(body: "{}")

        client.create_quote(
          type: type,
          cover_amount: cover_amount,
          cover_period: cover_period,
          basic_income_per_month: basic_income_per_month,
          education_status: education_status,
          smoker: smoker,
          gender: gender,
          age:    age)
      end
    end

    context "funeral cover" do
      let(:type) { "root_funeral" }
      let(:cover_amount) { 10_000_00 }
      let(:has_spouse) { true }
      let(:number_of_children) { 2 }
      let(:extended_family_ages) { [30, 21] }

      let(:expected_data) do
        {
          type: type,
          cover_amount:         cover_amount,
          has_spouse:           has_spouse,
          number_of_children:   number_of_children,
          extended_family_ages: extended_family_ages
        }
      end

       it "posts to the correct data to the correct url" do
        stub_request(:post, url)
          .with(body: expected_data)
          .to_return(body: "{}")

        client.create_quote(
          type: type,
          cover_amount:         cover_amount,
          has_spouse:           has_spouse,
          number_of_children:   number_of_children,
          extended_family_ages: extended_family_ages)
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
