# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_myopencall_session',
  :secret      => '4b9d54d55b488a741279408d0a2156ed9f24caf65402146c7f5b85e728163e62b7c2b6b8410de89de264b6cd4d7d73aa7f6ef165750a3134e36c30faea7e41cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
