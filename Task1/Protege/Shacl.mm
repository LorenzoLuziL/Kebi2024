prefix owl: <http://www.w3.org/2002/07/owl#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix xml: <http://www.w3.org/XML/1998/namespace> 
prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix sh: <http://www.w3.org/ns/shacl#> 
prefix kebi: <http://www.semanticweb.org/lauz/ontologies/2025/2/LuziLorenzoMenu/> 

kebi:RestaurantShape a sh:NodeShape ;
    sh:targetClass kebi:Restaurant ;
    sh:property [
        sh:path kebi:restaurant_hasMenu ;
        sh:node kebi:MenuShape ;
        sh:minCount 1 ;
        sh:message "It is impossible that a Restaurant does not have a menu!!" ;
    ] ;
    sh:property [
        sh:path kebi:restaurant_hasGuest ;
        sh:node kebi:GuestShape ;
        sh:minCount 0 ;
    ] .

kebi:MenuShape
    a sh:NodeShape ;
    sh:targetClass kebi:Menu ;
    
    # Constraint: At least one Meal in the Menu
    sh:property [
        sh:path kebi:menu_containsMeal ;
        sh:minCount 1 ;
        sh:message "Each menu must contain at least one meal." ;
    ] ;
    
    # Constraint: At least one Drink in the Menu
    sh:property [
        sh:path kebi:menu_containsDrink ;
        sh:minCount 1 ;
        sh:message "Each menu must contain at least one drink." ;
    ] .




### Shape for Guest

kebi:GuestShape a sh:NodeShape ;
    sh:targetClass kebi:Guest ;
    sh:property [
        sh:path kebi:guest_hasAllergy ;
        sh:node kebi:AllergyShape ;
        sh:minCount 0 ;
    ] ;
    sh:property [
        sh:path kebi:guest_hasCategory ;
        sh:node kebi:CategoryShape ;
        sh:minCount 1;
    ] ;
    
    sh:property [
        sh:path kebi:guest_isAtRiskForFood ;
        sh:node kebi:MealShape ;
    ] ;
    sh:property [
        sh:path kebi:guest_hasLevelOfCalorieConscious ;
        sh:datatype xsd:integer ;
        sh:minCount 0 ;
        sh:maxCount 4 ;
    ] ;
.
### Shape for Food

kebi:FoodShape a sh:NodeShape ;
    sh:targetClass kebi:Food ; 
    sh:property [
        sh:path kebi:hasKcal ;
        sh:datatype xsd:integer ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
    ] ;
.

### Shape for Meal

kebi:MealShape a sh:NodeShape ;
    sh:targetClass kebi:Meal ;
    sh:property [
        sh:path kebi:meal_hasLactoseIntolerance ;
        sh:node kebi:LactoseShape ;
        sh:minCount 0 ;
        sh:maxCount 1 ;
    ] ;
    sh:property [
        sh:path kebi:meal_hasGlutenIntolerance ;
        sh:node kebi:GlutenShape ;
        sh:minCount 0 ;
        sh:maxCount 1 ;
    ] ;
    sh:property [
        sh:path kebi:food_hasCategories ;
        sh:node kebi:CategoryShape ;
        sh:minCount 0 ;
    ] ;
    sh:property [
        sh:path kebi:meal_hasCourse ;
        sh:node kebi:CourseShape ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
    ] ;
    sh:property [
        sh:path kebi:meal_ingredients ;
        sh:node kebi:IngredientShape ;
        sh:minCount 1 ;
    ] ;
.
### Shape for Ingredient

kebi:IngredientShape a sh:NodeShape ;
    sh:targetClass kebi:Ingredient ;
.

### Shape for Drink

kebi:DrinkShape a sh:NodeShape ;
    sh:targetClass kebi:Drink ;
    sh:property [
        sh:path kebi:drink_hasIngredient ;
        sh:node kebi:IngredientShape ;
        sh:minCount 1;
    ] ;
    sh:property [
        sh:path kebi:hasKcal ;
        sh:datatype xsd:integer ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
    ] ;
.
### Shape for Allergy

kebi:AllergyShape a sh:NodeShape ;
    sh:targetClass kebi:Allergy ; 
.


### Shape for Lactose

kebi:LactoseShape a sh:NodeShape ;
    sh:targetClass kebi:Lactose ;
.


### Shape for Gluten

kebi:GlutenShape a sh:NodeShape ;
    sh:targetClass kebi:Gluten ;
.


### Shape for Category

kebi:CategoryShape a sh:NodeShape ;
    sh:targetClass kebi:Category ; 
.

### Shape for AnimalOriginProduct

kebi:AnimalOriginProductShape a sh:NodeShape ;
    sh:targetClass kebi:AnimalOriginProduct ;
.

### Shape for Dairy

kebi:DairyShape a sh:NodeShape ;
    sh:targetClass kebi:Dairy ;
    sh:property [
        sh:path kebi:ingredient_hasLactoseIntolerance ;
        sh:node kebi:LactoseShape ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
    ] ;
.
### Shape for Fruit

kebi:FruitShape a sh:NodeShape ;
    sh:targetClass kebi:Fruit ;
.

### Shape for Grain

kebi:GrainShape a sh:NodeShape ;
    sh:targetClass kebi:Grain ;
    sh:property [
        sh:path kebi:ingredient_hasGlutenIntolerance ;
        sh:node kebi:GlutenShape ;
        sh:minCount 1;
        sh:maxCount 1;
    ] ;
    
.

### Shape for Liquid

kebi:LiquidShape a sh:NodeShape ;
    sh:targetClass kebi:Liquid ;
.

### Shape for Meat

kebi:MeatShape a sh:NodeShape ;
    sh:targetClass kebi:Meat ;
.


### Shape for Seafood

kebi:SeafoodShape a sh:NodeShape ;
    sh:targetClass kebi:Seafood ;
.


### Shape for Seasoning

kebi:SeasoningShape a sh:NodeShape ;
    sh:targetClass kebi:Seasoning ;
.


### Shape for Vegetable

kebi:VegetableShape a sh:NodeShape ;
    sh:targetClass kebi:Vegetable ;
.


### Shape for Course

kebi:CourseShape a sh:NodeShape ;
    sh:targetClass kebi:Course ;
.


### Shape for Appetizer

kebi:AppetizerShape a sh:NodeShape ;
    sh:targetClass kebi:Appetizer ;
.


### Shape for FirstDish

kebi:FirstDishShape a sh:NodeShape ;
    sh:targetClass kebi:FirstDish ;
.


### Shape for MainDish

kebi:MainDishShape a sh:NodeShape ;
    sh:targetClass kebi:MainDish ;
.


### Shape for SecondCourse

kebi:SecondCourseShape a sh:NodeShape ;
    sh:targetClass kebi:SecondCourse ;
.


### Shape for Sidedish

kebi:SidedishShape a sh:NodeShape ;
    sh:targetClass kebi:Sidedish ;
.


### Shape for Dessert

kebi:DessertShape a sh:NodeShape ;
    sh:targetClass kebi:Dessert ;
.


### Linking Shapes to Classes

kebi:RestaurantShape sh:targetClass kebi:Restaurant .
kebi:MenuShape sh:targetClass kebi:Menu .
kebi:GuestShape sh:targetClass kebi:Guest .
kebi:FoodShape sh:targetClass kebi:Food .
kebi:MealShape sh:targetClass kebi:Meal .
kebi:IngredientShape sh:targetClass kebi:Ingredient .
kebi:AnimalOriginProductShape sh:targetClass kebi:AnimalOriginProduct .
kebi:DairyShape sh:targetClass kebi:Dairy .
kebi:FruitShape sh:targetClass kebi:Fruit .
kebi:GrainShape sh:targetClass kebi:Grain .
kebi:LiquidShape sh:targetClass kebi:Liquid .
kebi:MeatShape sh:targetClass kebi:Meat .
kebi:SeafoodShape sh:targetClass kebi:Seafood .
kebi:SeasoningShape sh:targetClass kebi:Seasoning .
kebi:TuberShape sh:targetClass kebi:Tuber .
kebi:CategoryShape sh:targetClass kebi:Category .
kebi:VegetarianShape sh:targetClass kebi:Vegetarian .
kebi:CarnivorousShape sh:targetClass kebi:Carnivorous .
kebi:AllergyShape sh:targetClass kebi:Allergy .
kebi:LactoseShape sh:targetClass kebi:Lactose .
kebi:GlutenShape sh:targetClass kebi:Gluten .
kebi:DrinkShape sh:targetClass kebi:Drink .
kebi:CourseShape sh:targetClass kebi:Course .
kebi:AppetizerShape sh:targetClass kebi:Appetizer .
kebi:FirstDishShape sh:targetClass kebi:FirstDish .
kebi:MainDishShape sh:targetClass kebi:MainDish .
kebi:SecondCourseShape sh:targetClass kebi:SecondCourse .
kebi:SidedishShape sh:targetClass kebi:Sidedish .
kebi:DessertShape sh:targetClass kebi:Dessert .

