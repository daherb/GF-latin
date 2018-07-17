concrete AdverbLat of Adverb = CatLat ** open ResLat, Prelude in
  {

  lin

--  PositAdvAdj : A -> Adv ;                 -- warmly
    PositAdvAdj a = { s = a.adv ! Posit } ;

--  PrepNP : Prep -> NP -> Adv ;        -- in the house
    PrepNP prep np =
      {
	s = prep.s ++ np.adv.s ++ np.det.s ! np.g ! prep.c ++ np.preap.s ! (Ag np.g np.n prep.c) ++
	  np.s ! prep.c ++  np.postap.s ! (Ag np.g np.n prep.c ) ++ np.det.sp ! np.g ! prep.c
      } ;


--  ComparAdvAdj  : CAdv -> A -> NP -> Adv ; -- more warmly than John
    ComparAdvAdj cadv a np = {
      s = cadv.s ++ a.adv ! Compar ++ cadv.p ++ np.s ! Nom
      } ;

--  ComparAdvAdjS : CAdv -> A -> S  -> Adv ; -- more warmly than he runs
    ComparAdvAdjS cadv a s =
      {
	s = cadv.s ++ a.adv ! Compar ++ cadv.p ++ combineSentence s ! SPreS ! PreV ! SOV ;
      } ;

--  AdAdv  : AdA -> Adv -> Adv ;             -- very quickly
    AdAdv = cc2 ;

--  PositAdAAdj : A -> AdA ;                 -- extremely
    PositAdAAdj a =
      { s = a.adv ! Posit } ;
    
-- Subordinate clauses can function as adverbs.

--  SubjS  : Subj -> S -> Adv ;              -- when she sleeps
    SubjS subj s = ss2 subj.s (combineSentence s ! SPreS ! PreV ! SOV ) ;
    
--  AdnCAdv : CAdv -> AdN ;                  -- less (than five)
    AdnCAdv cadv = {s = cadv.s ++ cadv.p} ;
--
}
