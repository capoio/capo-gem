module Capo
  module Recipes
    class << self
      def list
        require File.join(Capo.repository_path, 'lib/raw_recipe')
        recipes = RawRecipe.load_all
        longest_name_size = recipes.sort_by{|recipe| recipe[:name].size}.last[:name].size
        recipes.each do |recipe|
          name = recipe[:name]
          puts "#{name}#{' ' * (longest_name_size - name.size)}    #{recipe[:description]}"
        end
      end
    end
  end
end
