concrete ExtraLat of ExtraLatAbs =
	 CatLat,
	 ExtraLexiconLat ** 
  open ResLat, ParadigmsLat, Coordination, Prelude in {
  lin

    -- PastPartAP      : VPSlash -> AP ;         -- lost (opportunity) ; (opportunity) lost in space
    PastPartAP vp = { s = vp.part ! VPassPerf } ;
    
    UsePronNonDrop p = -- Pron -> NP
      {
	g = p.g ;
	n = p.n ;
	p = p.p ;
	s = p.pers ! PronNonDrop ! PronNonRefl ;
      } ;
    
    Nom_Prep = mkPrep "" Nom;
    Gen_Prep = mkPrep "" Gen;
    Acc_Prep = mkPrep "" Acc;
    Dat_Prep = mkPrep "" Dat;
    Abl_Prep = mkPrep "" Abl;
} 
