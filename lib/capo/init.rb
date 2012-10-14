require 'git'
require 'timeout'

module Capo
  module Init
    class << self
      def fetch_repository
        repository_url = 'git://github.com/capoio/capo.git'

        puts "Pulling changes from remote repository"
        begin
          repo = with_timeout{Git.open Capo.repository_path}
          puts with_timeout{repo.lib.send :command, 'pull'} # repo.pull is broken in git-1.2.5, see: https://github.com/schacon/ruby-git/issues/32
        rescue
          puts "Repository doesn't seem to exist yet..."
          puts "Cloning repository from #{repository_url} to #{Capo.repository_path}"
          with_timeout{Git.clone repository_url, Capo.repository_path}
          retry
        end
      end

      private
      def with_timeout
        begin
          Timeout::timeout 2 do
            yield
          end
        rescue Timeout::Error
          puts 'Git timeout. Skipping repository update.'
        end
      end
    end
  end
end
