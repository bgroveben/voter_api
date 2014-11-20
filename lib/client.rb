require 'civic_aide'

## Set API key with global configuration so resources can be accessed directly
CivicAide.api_key = ENV["GOOGLEAPIKEY"]

## Receive data only from official state sources
CivicAide.official_sources = true

## Get info for all elections
CivicAide.elections.all

## Find election info by address example
## client.election(4015).at('4910 Willet Drive, Annandale, VA 22003')

## Retrieve political geography and representative information based on an address example
## client.representatives.at('118 E. Main St. Carrboro, NC 27510')
