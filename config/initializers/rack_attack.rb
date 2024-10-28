class Rack::Attack

  if ENV.fetch("RAILS_ENV") == "production"
    self.cache.store = ActiveSupport::Cache::MemoryStore.new
  end
  
  throttle('default protector', limit: 300, period: 5.minutes) do |req|
    req.ip 
  end

  throttle('login protector', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.ip
    end
  end

  self.throttled_responder = lambda do |request|
    match_data = request.env['rack.attack.match_data']
    now = match_data[:epoch_time]

    headers = {
      'Content-Type' => 'application/json',
      'RateLimit-Limit' => match_data[:limit].to_s,
      'RateLimit-Remaining' => '0',
      'RateLimit-Reset' => (now + (match_data[:period] - now % match_data[:period])).to_s
    }

    body = { 'message' => "oh god, what do you want?" }.to_json

    [ 429, headers, [body]]
  end

end