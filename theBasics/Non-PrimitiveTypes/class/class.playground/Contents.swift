import Foundation

/// A class to Demonstrate class
/// A class is a call by reference
/// Changes made in the copy will reflect everywhere, Even in the root

class Recipe {
    var recipeName : String
    var ingredients : [String]
    var instructions : [String]
    
    init(recipeName: String, ingredients: [String], instructions: [String]) {
        self.recipeName = recipeName
        self.ingredients = ingredients
        self.instructions = instructions
    }
}

// Variable holding ingredients to make Biriyani
let biryaniIngredients = ["basmati rice", "chicken", "onion", "ginger paste", "garlic paste", "yogurt", "biryani masala", "red chili powder", "turmeric powder", "cilantro leaves", "mint leaves", "ghee or oil", "salt", "water"]

// Variable holding Instruction to make biriyani
let biryaniInstructions = [
"1. Rinse the rice well and soak it in cold water for 30 minutes. Drain the water and set the rice aside.",
"2. Heat the ghee or oil in a large pot over medium-high heat. Add the sliced onion and sauté until it turns golden brown.",
"3. Add the ginger and garlic paste and sauté for another 1-2 minutes.",
"4. Add the chicken and sauté for 5-7 minutes until the chicken is browned.",
"5. Add the yogurt, biryani masala, red chili powder, turmeric powder, cilantro leaves, mint leaves, and salt to the pot. Mix well and cook for 5-7 minutes until the chicken is cooked through.",
"6. In a separate pot, bring 4 cups of water to a boil. Add the soaked rice and cook until it is 70% done.",
"7. Strain the rice and add it to the pot with the chicken mixture. Gently mix the rice and chicken together.",
"8. Cover the pot and cook on low heat for 15-20 minutes until the rice is fully cooked and the flavors have melded together."
]

// Array Of recipes
var recipes = [Recipe]()

// Created Recipe1
let recipe1 = Recipe(recipeName: "Biriyani", ingredients: biryaniIngredients, instructions: biryaniInstructions)

//Added recipe1 to the recipe array
recipes.append(recipe1)

// Selected recipes[0] as selectedRecipeToEdit
let selectedRecipeToEdit = recipes[0]

// Made an edit here
selectedRecipeToEdit.recipeName = "Hyderabadi Biriyani"
// Reflected in the root
print(recipes[0].recipeName)

/// When you assign a class instance to another variable it passes the reference instead of value,
/// Which means that `recipes[0]` and also `selectedRecipeToEdit` points to the Memory Location.
/// Class variables participates in Reference Counting


