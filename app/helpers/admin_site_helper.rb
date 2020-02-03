module AdminSiteHelper
  def all_specialities_categories
    Category.all
  end

  def all_types_dishes
    Type.all
  end

  def all_restaurants
    Restaurant.all
  end

  def all_category_dishes
    CategoryDish.all
  end
  
end
