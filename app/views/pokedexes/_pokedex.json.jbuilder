json.extract! pokedex, :id, :name, :type, :hp, :def, :image, :created_at, :updated_at
json.url pokedex_url(pokedex, format: :json)
