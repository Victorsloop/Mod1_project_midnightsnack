require 'bundler'
Bundler.require
ActiveRecord::Base.logger = nil ##Removes sql log
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
