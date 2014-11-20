class ClientSerializer < ActiveModel::Serializer
  attributes :address, :election, :representative
end
