json.extract! card, :id, :card_column_id, :title, :body, :created_at, :updated_at
json.url card_url(card, format: :json)
json.body card.body.to_s
