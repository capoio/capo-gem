require 'git'

module Capo
  module Init
    class << self
      def fetch_repository
        repository_url = 'git://github.com/capoio/capo.git'

        puts "Pulling changes from remote repository"
        begin
          repo = Git.open Capo.repository_path
          puts repo.lib.send :command, 'pull' # repo.pull is broken in git-1.2.5, see: https://github.com/schacon/ruby-git/issues/32
        rescue
          puts "Repository doesn't seem to exist yet..."
          puts "Cloning repository from #{repository_url} to #{Capo.repository_path}"
          Git.clone repository_url, Capo.repository_path
          retry
        end
      end
    end
  end
end
