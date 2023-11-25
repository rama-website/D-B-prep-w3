
-- Table to store categories
CREATE TABLE Category (
  CategoryID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Table to store ingredients
CREATE TABLE Ingredient (
  IngredientID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Table to store steps
CREATE TABLE Step (
  StepID INT PRIMARY KEY,
  Description TEXT NOT NULL
);

-- Table to store recipes
CREATE TABLE Recipe (
  RecipeID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  -- Foreign key to link with Category table
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
  -- Ingredients will be stored in a separate table (RecipeIngredient)
  -- Steps will be stored in a separate table (RecipeStep)
);

-- Table to associate recipes with ingredients
CREATE TABLE RecipeIngredient (
  RecipeID INT,
  IngredientID INT,
  PRIMARY KEY (RecipeID, IngredientID),
  FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
  FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);

-- Table to associate recipes with steps
CREATE TABLE RecipeStep (
  RecipeID INT,
  StepID INT,
  StepNumber INT,
  PRIMARY KEY (RecipeID, StepID),
  FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
  FOREIGN KEY (StepID) REFERENCES Step(StepID)
);

--Based on the provided table structures and relationships, the database appears to be in at least 3NF.
-- The tables are structured to eliminate redundant data and maintain functional dependencies.
