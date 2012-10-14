module Capo
  module Recipes
    class << self
      def list
        longest_name_size = recipes.sort_by{|recipe| recipe[:name].size}.last[:name].size
        recipes.each do |recipe|
          name = recipe[:name]
          puts "#{name}#{' ' * (longest_name_size - name.size)}    #{recipe[:description]}"
        end
      end

      def add name
        raise "Recipe '#{name}' not found" unless recipes.map{|recipe| recipe[:name]}.include? name

        app_recipe_path = File.join app_deploy_path, "#{name}.rb"

        Dir.mkdir(app_deploy_path) unless Dir.exists?(app_deploy_path)

        puts "[#{name}] Copying recipe to #{app_recipe_path}"
        FileUtils.copy File.join(Capo.repository_path, 'recipes', name, "#{name}.rb"), app_recipe_path

        puts "[#{name}] Adding line to Capfile"
        capfile = File.join Capo.app_path, 'Capfile'
        File.open(capfile, 'a+'){|f| f.puts "load 'config/deploy/#{name}'"}

        puts "[#{name}] Recipe added"
      end

      def added
        puts "Installed recipes:"
        Dir[File.join(app_deploy_path, '*')].each do |recipe|
          puts "  * #{recipe.match(/config\/deploy\/(\w+).rb$/)[1]}"
        end
      end

      private
      def recipes
        require File.join(Capo.repository_path, 'lib/raw_recipe')
        RawRecipe.load_all
      end

      def app_deploy_path
        File.join Capo.app_path, 'config/deploy'
      end
    end
  end
end
