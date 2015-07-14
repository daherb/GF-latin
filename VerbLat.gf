--1 Construction rules for latin verb phrases
concrete VerbLat of Verb = CatLat ** open ResLat,IrregLat in {

  flags optimize=all_subs ;

  lin
--2 Complementization rules
    UseV = predV ; -- dormire

--    ComplVV v vp = insertObj (\\a => infVP v.isAux vp a) (predVV v) ;

--    ComplVS v s  = insertObj (\\_ => conjThat ++ s.s) (predV v) ;

    ComplVQ v q  = insertObj ( q.s ! QIndir) (predV v) ;

--    ComplVA v ap = insertObj (ap.s) (predV v) ;

    SlashV2a v = lin VP (predV2 v) ;

--    Slash2V3 v np = 
--      insertObjc (\\_ => v.c2 ++ np.s ! Acc) (predV v ** {c2 = v.c3}) ;

--    Slash3V3 v np = 
--      insertObjc (\\_ => v.c3 ++ np.s ! Acc) (predVc v) ; ----

--    SlashV2V v vp = insertObjc (\\a => infVP v.isAux vp a) (predVc v) ;

--    SlashV2S v s  = insertObjc (\\_ => conjThat ++ s.s) (predVc v) ;

    SlashV2Q v q  = lin VP (insertObjc (q.s ! QIndir) (predV2 v) ) ;

--    SlashV2A v ap = insertObjc (\\a => ap.s ! a) (predVc v) ; ----

    ComplSlash vp np = -- VPSlash -> NP -> VP
      insertObj (appPrep vp.c2 np.s) vp ;

--    SlashVV vv vp = 
--      insertObj (\\a => infVP vv.isAux vp a) (predVV vv) **
--        {c2 = vp.c2} ;

--    SlashV2VNP vv np vp = 
--      insertObjPre (\\_ => vv.c2 ++ np.s ! Acc)
--        (insertObjc (\\a => infVP vv.isAux vp a) (predVc vv)) **
--          {c2 = vp.c2} ;

--2 Other ways of forming verb phrases
    
--    ReflVP v = insertObjPre (\\a => v.c2 ++ reflPron ! a) v ;    

    UseComp comp = -- Comp -> VP
      insertAdj comp.s (predV be_V) ;

--    PassV2 v = insertObj (\\_ => v.s ! VPPart) (predAux auxBe) ;

--    AdvVP vp adv = insertObj adv.s vp ;

--    ExtAdvVP vp adv = vp

--    AdVVP adv vp = insertObj adv.s vp ;

--    AdvVPSlash : VPSlash -> Adv -> VPSlash ;  -- use (it) here

--    AdVVPSlash : AdV -> VPSlash -> VPSlash ;  -- always use (it)
   
--    VPSlashPrep : VP -> Prep -> VPSlash ;  -- live in (it)

    --2 Complements to copula
    
    CompAP ap = ap ;

--    CompNP np = {s = \\_ => np.s ! Acc} ;

--    CompAdv a = {s = \\_ => a.s} ;

--    CompCN

--    UseCopula v = v
}
