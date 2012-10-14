require 'git'

module Capo
  module Init
    class << self
      def fetch_repository
        repository_path = File.expand_path '~/.capo'
        repository_url = 'git://github.com/capoio/capo.git'

        puts "Pulling changes from remote repository"
        begin
          repo = Git.open repository_path
          puts repo.lib.send :command, 'pull' # repo.pull is broken in git-1.2.5, see: https://github.com/schacon/ruby-git/issues/32
        rescue
          puts "Reposito doesn't seem to exist yet..."
          puts "Cloning repository from #{repository_url} to #{repository_path}"
          Git.clone repository_url, repository_path
          retry
        end
      end
    end
  end
end
