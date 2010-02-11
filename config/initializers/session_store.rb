# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_allaiz_session',
  :secret      => '46c9db915b72239c6f4e16c7ee487ad876806c36731b32c4e8f26a2509c6f603594e4e1803b543ff12dbb021341d14dfdc5f6ad5e113162d9aaa162f4bca0bc1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
