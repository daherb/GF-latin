concrete SentenceLat of Sentence = CatLat ** open Prelude, ResLat in {

  flags optimize=all_subs ;

  lin

    PredVP np vp = -- NP -> VP -> Cl
      mkClause np vp ;
--
--    PredSCVP sc vp = mkClause sc.s (agrP3 Sg) vp ;
--
--    ImpVP vp = {
--      s = \\pol,n => 
--        let 
--          agr   = AgP2 (numImp n) ;
--          verb  = infVP True vp agr ;
--          dont  = case pol of {
--            CNeg True => "don't" ;
--            CNeg False => "do" ++ "not" ;
--            _ => []
--            }
--        in
--        dont ++ verb
--    } ;
   
--  SlashVP  : NP -> VPSlash -> ClSlash ;      -- (whom) he sees
    SlashVP np vp = 
      mkClause np ( vp ** {c2 = vp.c2} ) ;
--
--    AdvSlash slash adv = {
--      s  = \\t,a,b,o => slash.s ! t ! a ! b ! o ++ adv.s ;
--      c2 = slash.c2
--    } ;

--  SlashPrep : Cl -> Prep -> ClSlash ;         -- (with whom) he walks 
    SlashPrep cl prep = cl ** {c2 = prep.s} ;
--
--    SlashVS np vs slash = 
--      mkClause (np.s ! Nom) np.a 
--        (insertObj (\\_ => conjThat ++ slash.s) (predV vs))  **
--        {c2 = slash.c2} ;
--
--    EmbedS  s  = {s = conjThat ++ s.s} ;
--    EmbedQS qs = {s = qs.s ! QIndir} ;
--    EmbedVP vp = {s = infVP False vp (agrP3 Sg)} ; --- agr
--
    UseCl  t p cl = -- Temp -> Pol-> Cl -> S
      (combineClause cl t t.a p VQFalse) ;

    -- TO FIX
    --UseQCl t p cl =
      --      s = \\q => t.s ++ p.s ++ cl.s ! t.t ! t.a ! p ! q
      -- { s = \\q => combineSentence (combineClause cl t t.a p VQFalse) ! PreV ! VSO } ; 

--    UseRCl t p cl = {
--      s = \\r => t.s ++ p.s ++ cl.s ! t.t ! t.a ! ctr p.p ! r ;
--      c = cl.c
--    } ;
--    UseSlash t p cl = {
--      s = t.s ++ p.s ++ cl.s ! t.t ! t.a ! ctr p.p  ! ODir ;
--      c2 = cl.c2
--    } ;
--
    -- AdvS : Adv -> S -> S
    AdvS a s = { s = s.s ; o = s.o ; v = s.v ; neg = s.neg ; t = s.t ; p = s.p ; sadv = lin Adv a } ;

-- This covers subjunctive clauses, but they can also be added to the end.
    --  SSubjS : S -> Subj -> S -> S ;       -- I go home if she comes
    -- TO FIX
--    SSubjS s1 subj s2 = { s =  \\_ => subj.s ++ s2.s ! PreS ++ s1.s ! PreS ; sadv = lin Adv (mkAdverb []) } ;
    
--    RelS s r = {s = s.s ++ "," ++ r.s ! agrP3 Sg} ;
--
--  oper
--    ctr = contrNeg True ;  -- contracted negations
--
}

