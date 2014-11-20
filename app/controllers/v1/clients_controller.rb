module V1
  class ClientsController < ApplicationController
## Google Civic Information API does not allow GET requests
##  POST /clients
##  POST /clients.json

      def show
        @client = Client.find(params[:address])

        render json: @client
      end

    # Require strong_params/replace attr_accessible
    private
      def client_params
        params.require(:address, :election, :representative).permit(:address, :election, :representative)
      end
  end
end
