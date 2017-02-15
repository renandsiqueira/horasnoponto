Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :facebook, '315409608861528', 'b7677d916b99bdb4aab83f481e801639'
  elsif Rails.env.production?
    provider :facebook, 'PRODUCTION_APP_ID', 'PRODUCTION_APP_SECRET'
  end
end