Rails.application.config.middleware.use OmniAuth::Builder do
  # byebug
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], :skip_jwt => true
  end