Rails.application.config.session_store :cookie_store, key: '_mktour_session', domain: {
  production: 'https://mktour2019.herokuapp.com',
  development: 'localhost:3000'
}.fetch(Rails.env.to_sym, :all)