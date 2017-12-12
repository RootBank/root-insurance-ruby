class Root::Insurance::Client
  module Application

    def create_application(policyholder_id:, quote_package_id:, monthly_premium:, serial_number: nil)
      data = {
        policyholder_id:  policyholder_id,
        quote_package_id: quote_package_id,
        monthly_premium:  monthly_premium,
        serial_number:    serial_number
      }

      post(:applications, data)
    end

  end
end
