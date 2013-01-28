#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Bin
    class Create < Shebang::Command
      command :create
      banner  'Creates the files for a Blogaze installation'
      usage   'blogaze create [DIR]'

      # Path to the prototype application to use for new installations.
      PROTOTYPE = __DIR__('../../../proto')

      def index
        # Require the name argument
        if ARGV[0] == '' or ARGV[0].nil?
          puts "Missing argument [NAME]"
          return
        end

        # Destination to copy files
        destination = File.join(Dir.pwd, ARGV[0])

        # Make sure the destination doesn't exist
        if File.directory?(destination) and !option(:f)
          puts "Directory already exists with name: #{ARGV[0]}"
          return
        else
          # Copy files
          puts 'Copying files...'
          FileUtils.cp_r(PROTOTYPE, destination)

          # Rename config files
          ['config.default.rb', 'database.default.rb'].each do |config|
            FileUtils.mv(destination + "/config/#{config}", destination + "/config/" + config.gsub('.default', ''))
          end

          # Tell the user what to do next
          puts 'Done.'
          puts
          puts "You will need to enter your database information"
          puts "into the 'config/database.rb' file then run the"
          puts "following commands:"
          puts
          puts "  rake db:migrate"
          puts "  rake db:defaults"
          puts
          puts "The default admin account is:"
          puts "  Username: admin"
          puts "  Password: admin"
          puts
        end
      end
    end
  end
end
