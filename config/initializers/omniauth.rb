Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'KFmY7FZfHs4nPCsuerXj61isy','K3z9WkgHN2uAbppe7MaYRyyLJf1lCVHWHPtVpEtyyCSJFpYCHb'
  provider :google_oauth2, '476602585408-3fiklaclekbinfmbd2lsdjcur1u21ril.apps.googleusercontent.com', 'RX-7Mq_SXT1DJSJsYJtLj6a4',
  			{scope: 'email, profile, plus.me, plus.login, plus.me' , access_type: 'offline' , prompt: 'consent'  }
end


OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}