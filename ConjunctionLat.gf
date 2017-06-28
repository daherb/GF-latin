concrete ConjunctionLat of Conjunction = 
  CatLat ** open ResLat, StructuralLat, Coordination, Prelude in {
--
--  flags optimize=all_subs ;
    --

  lin
    -- ConjS    : Conj -> ListS -> S ;       -- he walks and she runs
    ConjS conj ss = conjunctDistrSS conj (ss.l ! conj.c) ;

    -- ConjAdv  : Conj -> ListAdv -> Adv ;   -- here or there
    ConjAdv conj ss = conjunctDistrSS conj (ss.l ! conj.c) ;

    -- ConjNP   : Conj -> ListNP -> NP ;     -- she or we
    ConjNP conj ss = conjunctDistrTable Case conj (ss.l ! conj.c) **
      { n = case conj.c of { And => Pl ; _ => ss.n } ;
	g = ss.g ;
	p = ss.p } ;

    -- ConjAP   : Conj -> ListAP -> AP ;
    ConjAP conj ss = conjunctDistrTable Agr conj (ss.l ! conj.c) ;

    --
--    DConjS = conjunctDistrSS ;
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

    -- BaseS : S -> S -> ListS
    BaseS x y = { l = \\c => twoSS x y } ;

    -- ConsS : S -> ListS -> ListS
    ConsS x xs = { l = \\c => (case c of
	{
	  And => consrSS and_Conj.s2 x (xs.l ! c) ;
	  Or => consrSS or_Conj.s2 x (xs.l ! c) ;
	  If => consrSS if_then_Conj.s2 x (xs.l ! c) ;
	  _ => consrSS "," x (xs.l ! c)
	}) } ;

    -- BaseAdv : Adv -> Adv -> ListAdv
    BaseAdv x y = { l = \\c => twoSS x y} ;

    -- ConsAdv : Adv -> ListAdv -> ListAdv
    ConsAdv x xs = { l = \\c => (case c of
	{
	  And => consrSS and_Conj.s2 x (xs.l ! c) ;
	  Or => consrSS or_Conj.s2 x (xs.l ! c) ;
	  If => consrSS if_then_Conj.s2 x (xs.l ! c) ;
	  _ => consrSS "," x (xs.l ! c) 
	}) } ;

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
	  If => consrTable Case if_then_Conj.s2 x (xs.l ! c) ;
	  _ => consrTable Case "," x (xs.l ! c)
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
			If => consrTable Agr if_then_Conj.s2 x (xs.l ! c) ;
			_ => consrTable Agr "," x (xs.l ! c)
		      })
      } ;
--
  lincat
    [S] = { l : Coordinator => {s1,s2 : Str}} ;
    [Adv] = { l: Coordinator => {s1,s2 : Str}} ;
    [NP] = {l : Coordinator => {s1,s2 : Case => Str} ; g : Gender ; n : Number ; p : Person } ;
    [AP] = {l : Coordinator => {s1,s2 : Agr => Str } } ;

  oper
    -- Generates a new number value given two number values.
    --   Pl if any of the two is Pl
    --   Sg otherwise
    matchNumber : Number -> Number -> Number = \n1,n2 ->
      case <n1,n2> of {
	<Pl,_> => Pl ;
	<_,Pl> => Pl ;
	<_,_> => Sg
      } ;
--
}
