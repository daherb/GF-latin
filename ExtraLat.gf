concrete ExtraLat of ExtraLatAbs =
	 CatLat,
	 ExtraLexiconLat ** 
  open ResLat, ParadigmsLat, Coordination, Prelude in {
  lincat CS = Str ;
  lin
    useS s = combineSentence s ! SPreO ! PreO ! SOV ;
    -- PastPartAP      : VPSlash -> AP ;         -- lost (opportunity) ; (opportunity) lost in space
--    PastPartAP vp = { s = vp.part ! VPassPerf } ;
    
    UsePronNonDrop p = -- Pron -> NP
      {
	g = p.pers.g ;
	n = p.pers.n ;
	p = p.p ;
	s = p.pers.s ! PronNonDrop ! PronNonRefl ;
	adv = ss "" ;
	preap, postap = { s = \\_ => "" } ;
	det = { s = \\_,_ => "" ; sp = \\_,_ => "" ; n = p.pers.n } ;
      } ;
    
    Nom_Prep = mkPrep "" Nom;
    Gen_Prep = mkPrep "" Gen;
    Acc_Prep = mkPrep "" Acc;
    Dat_Prep = mkPrep "" Dat;
    Abl_Prep = mkPrep "" Abl;
} 
