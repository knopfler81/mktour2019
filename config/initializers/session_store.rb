Rails.application.config.session_store :cookie_store, key: '_mktour2019_session', domain: {
   production: 'mktour2019.herokuapp.com',
   development: 'localhost:3000'
 }.fetch(Rails.env.to_sym, :all)