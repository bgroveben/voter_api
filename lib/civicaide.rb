module Civicaide

  def make_civic_client
    CivicAide::Client.new ENV["GOOGLEAPIKEY"]
  end

  # def get_elections
    # client = self.make_civic_client
    # elections = client.elections.all
  # end

  def get_elections
    client = self.make_civic_client
    users_elections = []
    elections = client.elections.all
    all_elections = elections["elections"]
    all_elections.find_all do |election|
      name = election.name
      id = election.id
      users_elections << id
    end
    users_elections
  end

  def election_info
    client = self.make_civic_client
    election = client.election(4015).at('4910 Willet Drive, Annandale, VA 22003')
  end

  def representative_info
    client = self.make_civic_client
    reps = client.representatives.at('118 E. Main St. Carrboro, NC 27510')
  end

  #def get_representatives
    #client = self.make_civic_client
    #users_reps = []
    #reps = client.representatives.all
    #offices = reps["offices"]
    #officials = reps["officials"]
  #end
