# frozen_string_literal: true

# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { 'v1' }

  field :address,      type: :string,  default: 'Nieznany'
  field :latitude,     type: :string,  default: ''
  field :longitude,    type: :string,  default: ''
  field :description,  type: :text,    default: 'Nieznany'
  field :is_recording, type: :boolean, default: 0
end
