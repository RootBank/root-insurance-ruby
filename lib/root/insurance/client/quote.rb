class Root::Insurance::Client
  module Quote
    def create_quote(type:, model_name: nil)
      data = {
        type:       type,
        model_name: model_name
      }

      post(:quotes, data)
    end

    def list_gadget_models
      get('gadgets/models')
    end
  end
end
