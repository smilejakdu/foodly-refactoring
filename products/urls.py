from django.urls import path

from .views import (
        ProductView,
        ProductDetailView,
        ProductCategoryView,
        RecipeView,
        RecipeDetailView,
        BundleView,
        RecommendationView,
        SearchView,
)

urlpatterns = [
        path('/collections/product',              ProductView.as_view()),
        path('/collections/<slug:category_name>', ProductCategoryView.as_view()),
        path('/<int:product_id>',                 ProductDetailView.as_view()),
        path('/recipes',                          RecipeView.as_view()),
        path('/recipes/<int:recipe_id>',          RecipeDetailView.as_view()),
        path('/promotion',                        BundleView.as_view()),
        path('/lookbook',                         RecommendationView.as_view()),
        path('/search',                           SearchView.as_view()),
 ]
