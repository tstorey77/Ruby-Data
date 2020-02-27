# frozen_string_literal: true

json.extract! ptype, :id, :ptype, :chinese, :japanese, :created_at, :updated_at
json.url ptype_url(ptype, format: :json)
