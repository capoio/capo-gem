module Capo
  module Capfile
    class << self
      def generate
        files.each do |file, content|
          file = File.join Capo.app_path, file
          if File.exists?(file)
            warn "[skip] '#{file}' already exists"
          elsif File.exists?(file.downcase)
            warn "[skip] '#{file.downcase}' exists, which could conflict with '#{file}'"
          else
            unless File.exists?(File.dirname(file))
              puts "[add] making directory '#{File.dirname file}'"
              FileUtils.mkdir File.dirname(file)
            end
            puts "[add] writing '#{file}'"
            File.open(file, 'w'){|f| f.write content}
          end
        end
      end

      private
      def capfile
        <<-FILE
          load 'deploy'

          load 'config/deploy'
        FILE
      end

      def config_deploy
        <<-FILE
          set :application, "set your application name here"
          set :repository,  "set your repository location here"
          set :branch,      "set your branch here"

          role :web, "your web-server here"                          # Your HTTP server, Apache/etc
          role :app, "your app-server here"                          # This may be the same as your `Web` server
          role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
          role :db,  "your slave db-server here"
        FILE
      end

      def files
        {
          "Capfile" => unindent(capfile),
          "config/deploy.rb" => unindent(config_deploy)
        }
      end

      def unindent string
        indentation = string[/\A\s*/]
        string.strip.gsub /^#{indentation}/, ''
      end
    end
  end
end
