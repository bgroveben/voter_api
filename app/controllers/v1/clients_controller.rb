## TODO
## Create definitions that will allow the app to access Google's Civic Information API and
## retrieve election info and representative info based on the users address. The 'civic_aide'
## gem can be found at github.com/tylerpearson/civic_aide.

##require 'civic_aide'

module V1
  class ClientsController < ApplicationController

## Google Civic Information API does not allow GET requests
##  POST /clients
##  POST /clients.json

      def show
        @client = Client.find(params[:id]) # Google's API requires an address

        render json: @client
      end

    # Require strong_params/replace attr_accessible
    private
      def client_params
        params.require(:id, :election, :representative).permit(:id, :election, :representative)
      end
  end
end


## Set API key with global configuration so resources can be accessed directly
## CivicAide.api_key = ENV["GOOGLEAPIKEY"]

## Receive data only from official state sources
## CivicAide.official_sources = true

## Get info for all elections
## CivicAide.elections.all

## Find election info by address example
## client.election(4015).at('4910 Willet Drive, Annandale, VA 22003')

## Retrieve political geography and representative information based on an address example
## client.representatives.at('118 E. Main St. Carrboro, NC 27510')
