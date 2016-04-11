--# -path=.:alltenses:prelude

resource CombinatorsLat = Combinators with 
  (Cat = CatLat),
  (Structural = StructuralLat),
  (Noun = NounLat),
  (Constructors = ConstructorsLat)