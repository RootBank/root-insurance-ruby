class Root::Insurance::Client
  module Quote
    def create_quote(opts={})
      type = opts[:type]

      case type.to_sym
      when :root_gadgets
        create_gadget_quote(opts)
      when :root_term
        create_term_quote(opts)
      when :root_funeral
        create_funeral_quote(opts)
      else
        raise ArgumentError("Unknown quote type: #{type}")
      end
    end

    def list_gadget_models
      get('gadgets/models')
    end

    private
    def create_gadget_quote(opts)
      data = {
        type:       :root_gadgets,
        model_name: opts[:model_name]
      }

      post(:quotes, data)
    end

    def create_term_quote(opts)
      data = {
        type:             :root_term,
        cover_amount:     opts[:cover_amount],
        cover_period:     opts[:cover_period],
        education_status: opts[:education_status],
        smoker:           opts[:smoker],
        gender:           opts[:gender],
        age:              opts[:age],
        basic_income_per_month: opts[:basic_income_per_month],
      }

      post(:quotes, data)
    end

    def create_funeral_quote(opts)
      data = {
        type:                 :root_funeral,
        cover_amount:         opts[:cover_amount],
        has_spouse:           opts[:has_spouse],
        number_of_children:   opts[:number_of_children],
        extended_family_ages: opts[:extended_family_ages]
      }

      post(:quotes, data)
    end
  end
end
