require 'csv'
require_relative 'recipe'

class Cookbook
  attr_accessor :recipes

  def initialize(csv_file_path)
    @recipes = []
    @csv = csv_file_path
    CSV.foreach(@csv) do |row|
      @recipes << Recipe.new(row[0].to_s, row[1].to_s)
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe

    CSV.open(@csv, 'wb') do |row|
      @recipes.each { |rec| row << [rec.name, rec.description] }
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    CSV.open(@csv, 'wb') do |row|
      @recipes.each { |rec| row << [rec.name, rec.description] }
    end
  end

  def mark_recipe_as_done(recipe_index)
    @recipes[recipe_index].mark_as_done!
    CSV.open(@csv, 'wb') do |row|
      @recipes.each { |rec| row << [rec.name, rec.description] }
    end
  end

end
