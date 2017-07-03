--1 Construction rules for latin verb phrases
concrete VerbLat of Verb = CatLat ** open (S=StructuralLat),ResLat,IrregLat,ExtraLat in {

  flags optimize=all_subs ;

  lin
--2 Complementization rules

--  UseV : V -> VP
    UseV = predV ; -- dormire

--  ComplVV : VV -> VP -> VP ;  -- want to run        
    ComplVV v vp =
      {
	s = vp.s ;
	part = vp.part ;
	imp = vp.imp ;
	inf = vp.inf ;
	obj = vp.obj ;
	compl = vp.compl ;
	adv = vp.adv 
      };

--  ComplVS : VS -> S -> VP ;  -- say that she runs
    ComplVS v s  = insertObj ( dummyNP (S.that_Subj.s ++ s.s)) Nom_Prep (predV v) ;

--  ComplVQ : VQ -> QS -> VP ;  -- wonder who runs
    ComplVQ v q  = insertObj (dummyNP (q.s ! QIndir)) Nom_Prep (predV v) ;
    
--  ComplVA : VA -> AP -> VP ;  -- they become red
    ComplVA v ap = (predV v) ** { adj = ap.s } ;

--  SlashV2a : V2 -> VPSlash ;  -- love (it)
    SlashV2a v = lin VP (predV2 v) ;

--    Slash2V3 v np = 
    --      insertObjc (\\_ => v.c2 ++ np.s ! Acc) (predV v ** {c2 = v.c3}) ;
    
--  Slash3V3 : V3  -> NP -> VPSlash ;  -- give (it) to her
    Slash3V3 v np =
      lin VP ( insertObjc np ( predV3 v ) ) ;

--    SlashV2V v vp = insertObjc (\\a => infVP v.isAux vp a) (predVc v) ;

--    SlashV2S v s  = insertObjc (\\_ => conjThat ++ s.s) (predVc v) ;

--  SlashV2Q : V2Q -> QS -> VPSlash ;  -- ask (him) who came
    SlashV2Q v q  = lin VP (insertObjc (dummyNP (q.s ! QIndir)) (predV2 v) ) ;

--  SlashV2A : V2A -> AP -> VPSlash ;  -- paint (it) red
    SlashV2A v ap = lin VP ( (predV2 v) ** { adj = ap.s } ) ; 

--  ComplSlash : VPSlash -> NP -> VP ; -- love it
    ComplSlash vp np = -- VPSlash -> NP -> VP
      insertObj np vp.c2 vp ;

--    SlashVV vv vp = 
--      insertObj (\\a => infVP vv.isAux vp a) (predVV vv) **
--        {c2 = vp.c2} ;

--    SlashV2VNP vv np vp = 
--      insertObjPre (\\_ => vv.c2 ++ np.s ! Acc)
--        (insertObjc (\\a => infVP vv.isAux vp a) (predVc vv)) **
--          {c2 = vp.c2} ;

--2 Other ways of forming verb phrases
    
--    ReflVP v = insertObjPre (\\a => v.c2 ++ reflPron ! a) v ;    

--  UseComp : Comp -> VP
    UseComp comp = 
      insertAdj comp.s (predV be_V) ;

--    PassV2 v = insertObj (\\_ => v.s ! VPPart) (predAux auxBe) ;

--  AdvVP    : VP -> Adv -> VP ;        -- sleep here
    AdvVP vp adv = insertAdv adv vp ;

--    ExtAdvVP vp adv = vp

    AdVVP adv vp = insertAdv adv vp ;

--    AdvVPSlash : VPSlash -> Adv -> VPSlash ;  -- use (it) here

--    AdVVPSlash : AdV -> VPSlash -> VPSlash ;  -- always use (it)
   
--    VPSlashPrep : VP -> Prep -> VPSlash ;  -- live in (it)

    --2 Complements to copula

--  CompAP : AP -> Comp
    CompAP ap = ap ;
    
    -- CompNP : NP -> Comp
    CompNP np = {s = \\_ => np.s ! Nom} ;

--    CompAdv a = {s = \\_ => a.s} ;

    -- CompCN : CN -> Comp
    CompCN cn = {s = table { Ag g n c => cn.preap.s ! Ag cn.g n Nom ++ cn.s ! n ! Nom ++ cn.postap.s ! Ag cn.g n Nom} };
--    UseCopula v = v
}
