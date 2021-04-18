
class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_attributes) #naming the has the same as the method is confusing.
    categories_attributes.values.each do |category|
      if !category[:name].empty?
        self.categories << Category.find_or_create_by(name: category[:name])
      end
    end
  end


=begin
  def categories_attributes=(attributes) #attributes is a hash with keys of the index number of attributes.
    #the index number has a key of a hash that contains a key of the attribute name and a value of the info entered into the form.
    attributes.values.each do |category|
      #attributes.values will place those {attribute_name: "value"} hashes into an array. category will then be an individual has that each iterated over.
      #after that, you can work on the individual hashes just as you normally would.
      binding.pry
      if !category[:name].empty?
        self.categories << Category.find_or_create_by(name: category[:name])
      end
    end
  end
=end
end
