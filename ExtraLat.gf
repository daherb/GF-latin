concrete ExtraLat of ExtraLatAbs =
	 CatLat,
	 ExtraLexiconLat ** 
  open ResLat, Coordination, Prelude in {
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
} 
