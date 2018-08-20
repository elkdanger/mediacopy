require 'sqlite3'
require 'fileutils'

module MediaCopy
  # Methods for setting up/tearing down the ledger system
  module Ledger
    @db_path = File.expand_path '~/.mediacopy/mediacopy.db'

    def self.setup
      dir = File.dirname @db_path

      FileUtils.mkdir_p dir unless Dir.exist? dir

      db = SQLite3::Database.new @db_path

      db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS ledger (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          path varchar(2048)
        )
      SQL

      db.execute <<-SQL
        CREATE UNIQUE INDEX IF NOT EXISTS ledger_path
        ON ledger (path)
      SQL
    end

    def self.destroy
      FileUtils.rm @db_path
    end
  end
end
