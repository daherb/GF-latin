concrete ConjunctionLat of Conjunction = 
  CatLat ** open ResLat, StructuralLat, Coordination, Prelude in {
--
--  flags optimize=all_subs ;
--
  lin
--
    ConjS = conjunctDistrSS ;
--
    ConjAdv = conjunctDistrSS ;

    -- ConjNP   : Conj -> ListNP -> NP ;     -- she or we
    ConjNP conj ss = conjunctDistrTable Case conj (ss.l ! conj.c) **
      { n = case conj.c of { And => Pl ; _ => ss.n } ;
	g = ss.g ;
	p = ss.p } ;

    -- ConjAP   : Conj -> ListAP -> AP ;
    ConjAP conj ss = conjunctDistrTable Agr conj (ss.l ! conj.c) ;
--
--
--{---b
--
--    ConjS = conjunctSS ;
--    DConjS = conjunctDistrSS ;
--
--    ConjAdv = conjunctSS ;
--    DConjAdv = conjunctDistrSS ;
--
--    ConjNP conj ss = conjunctTable Case conj ss ** {
--      a = conjAgr (agrP3 conj.n) ss.a 
--      } ;
--    DConjNP conj ss = conjunctDistrTable Case conj ss ** {
--      a = conjAgr (agrP3 conj.n) ss.a
--      } ;
--    DConjAP conj ss = conjunctDistrTable Agr conj ss ** {
--      isPre = ss.isPre
--      } ;
---}
--
---- These fun's are generated from the list cat's.
--
--    BaseS = twoSS ;
--    ConsS = consrSS comma ;
    BaseAdv = twoSS ;
    ConsAdv = consrSS "et" ;
    -- BaseNP : NP -> NP -> ListNP ;      -- John, Mary
    BaseNP x y = {
      l = \\c => twoTable Case x y ;
      g = Masc ; -- Just guessing
      n = matchNumber x.n y.n ;
      p = P3 } ; 
    -- ConsNP : NP -> ListNP -> ListNP ;  -- John, Mary, Bill
    ConsNP x xs = {
      l = \\c => (case c of
	{
	  And => consrTable Case and_Conj.s2 x (xs.l ! c) ;
	  Or => consrTable Case or_Conj.s2 x (xs.l ! c) ;
	  If => consrTable Case if_then_Conj.s2 x (xs.l ! c)
	});
      n = matchNumber x.n xs.n ;
      g = xs.g ;
      p = xs.p
      } ;
    
    -- BaseAP : AP -> AP -> ListAP
    BaseAP x y = { l = \\c => twoTable Agr x y };

    -- ConsAP : AP -> ListAP -> ListAP
    ConsAP x xs =
      { l = \\c => (case c of
		      {
			And => consrTable Agr and_Conj.s2 x (xs.l ! c) ;
			Or => consrTable Agr or_Conj.s2 x (xs.l ! c) ;
			If => consrTable Agr if_then_Conj.s2 x (xs.l ! c)
		      })
      } ;
--
  lincat
    [S] = {s1,s2 : Str} ;
    [Adv] = {s1,s2 : Str} ;
    [NP] = {l : Coordinator => {s1,s2 : Case => Str} ; g : Gender ; n : Number ; p : Person } ;
    [AP] = {l : Coordinator => {s1,s2 : Agr => Str } } ;

  oper
    matchNumber : Number -> Number -> Number = \n1,n2 ->
      case <n1,n2> of {
	<Pl,_> => Pl ;
	<_,Pl> => Pl ;
	<_,_> => Sg
      } ;
--
}
