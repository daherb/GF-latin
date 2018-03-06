concrete AdverbLat of Adverb = CatLat ** open ResLat, Prelude in
  {

  lin
--    PositAdvAdj a = {s = a.s ! AAdv} ;
--    ComparAdvAdj cadv a np = {
--      s = cadv.s ++ a.s ! AAdv ++ "than" ++ np.s ! Nom
--      } ;
--    ComparAdvAdjS cadv a s = {
--      s = cadv.s ++ a.s ! AAdv ++ "than" ++ s.s
--      } ;

--  PrepNP : Prep -> NP -> Adv ;        -- in the house
    PrepNP prep np = {s = prep.s ++ np.adv.s ++ np.det.s ! np.g ! prep.c ++ np.preap.s ! (Ag np.g np.n prep.c) ++ np.s ! prep.c ++  np.postap.s ! (Ag np.g np.n prep.c ) ++ np.det.sp ! np.g ! prep.c } ;

--    AdAdv = cc2 ;

-- Subordinate clauses can function as adverbs.

--  SubjS  : Subj -> S -> Adv ;              -- when she sleeps
    SubjS subj s = ss2 subj.s (s.s ! PreS ) ; -- cc2 ;
    
-----b    AdvSC s = s ; --- this rule give stack overflow in ordinary parsing
--
--    AdnCAdv cadv = {s = cadv.s ++ "than"} ;
--
}
