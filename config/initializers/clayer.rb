CLAYER_CLIENT = Commercelayer::Client.new(
  {
    client_id: ENV['CLAYER_CLIENT_ID'],
    client_secret: ENV['CLAYER_CLIENT_SECRET'],
    site: ENV['CLAYER_SITE'],
    scope: ENV['CLAYER_SCOPE']
  }
)
