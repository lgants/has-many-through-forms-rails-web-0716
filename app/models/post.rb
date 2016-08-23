class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  # below doesn't crossreference to check for prexisting categories with same name
  # commented out so that we can use our custom method below
  # accepts_nested_attributes_for :categories


  # custom method to crossreference for prexisting categories with same name
  def categories_attributes=(category_attributes)
      category_attributes.values.each do |category_attribute|
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
  end

  # accepts_nested_attributes_for :categories <- makes code below unnesecary
  # below doesn't crossreference to check for prexisting categories with same name
  # def categories_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     self.post_categories.build(category: category)
  #   end
  # end

end
