concrete NounLat of Noun = CatLat ** open ResLat, Prelude, ConjunctionLat in {

  flags optimize=all_subs ;

  lin
    DetCN det cn = -- Det -> CN -> NP
      {
	s = \\c => det.s ! cn.g ! c ++ cn.s ! det.n ! c ; -- might be slightly problematic because preap will be added before the determiner
	n = det.n ; g = cn.g ; p = P3 ;
	adv = cn.adv ;
	preap = cn.preap ;
	postap = cn.postap
      } ;

    UsePN pn = lin NP { s = pn.s ! Sg ; g = pn.g ; n = Sg ; p = P3 ;  adv = ss "" ; preap, postap = { s = \\_ => "" } } ;
    UsePron p = -- Pron -> Np
      { 
	g = p.g ;
	n = p.n ;
	p = p.p ;
	s = \\c => case c of { 
	  Nom => p.pers ! PronDrop ! PronNonRefl ; -- Drop pronoun in nominative case
	  _ => p.pers ! PronNonDrop ! PronNonRefl  -- but don't drop it otherwise
	  } ! c ;
	adv = ss "" ;
	preap, postap = { s = \\_ => "" } 
      } ;
--    PredetNP pred np = {
--      s = \\c => pred.s ++ np.s ! c ;
--      a = np.a
--      } ;
--
--    PPartNP np v2 = {
--      s = \\c => np.s ! c ++ v2.s ! VPPart ;
--      a = np.a
--      } ;
--
--    RelNP np rs = {
--      s = \\c => np.s ! c ++ "," ++ rs.s ! np.a ;
--      a = np.a
--      } ;

--    AdvNP   : NP -> Adv -> NP ;    -- Paris today
    AdvNP np adv = {
      s = \\c => np.s ! c ;
      g = np.g ; n = np.n; p = np.p ;
      adv = adv ;
      preap = np.preap ;
      postap = np.postap
			     
      } ;
--
--    DetQuantOrd quant num ord = {
--      s  = quant.s ! num.hasCard ! num.n ++ num.s ++ ord.s ; 
--      sp = quant.sp ! num.hasCard ! num.n ++ num.s ++ ord.s ; 
--      n  = num.n
--      } ;
--
    DetQuant quant num = {
      s  = \\g,c => quant.s  ! Ag g num.n c ++ num.s ! g ! c ;
      sp = \\g,c => quant.sp ! Ag g num.n c ++ num.s ! g ! c ;
      n  = num.n
      } ;

    DetNP det = {
      s = det.s ! Neutr ;
      g = Neutr ;
      n = det.n ;
      p = P3 ;
      adv = ss "" ;
      preap, postap = { s = \\_ => "" } 
    } ;

--    PossPron p = {
--      s = \\_,_ => p.s ! Gen ;
--      sp = \\_,_ => p.sp 
--      } ;
--
    NumSg = {s = \\_,_ => [] ; n = Sg} ;
    NumPl = {s = \\_,_ => [] ; n = Pl} ;

--    NumCard n = n ** {hasCard = True} ;
--
--    NumDigits n = {s = n.s ! NCard ; n = n.n} ;
--    OrdDigits n = {s = n.s ! NOrd} ;
--
--    NumNumeral numeral = {s = numeral.s ! NCard; n = numeral.n} ;
--    OrdNumeral numeral = {s = numeral.s ! NOrd} ;
--
--    AdNum adn num = {s = adn.s ++ num.s ; n = num.n} ;
--
--    OrdSuperl a = {s = a.s ! AAdj Superl} ;

    DefArt = {
      s = \\_ => [] ;
      sp = \\_ => [] ;
      } ;

    IndefArt = {
      s = \\_ => [] ;
      sp = \\_ => [] ;
      } ;

    MassNP cn =
      {
	s = cn.s ! Sg ;
	-- s = case cn.massable of { True => cn.s ! Sg ; False => \\_ => nonExist } ;
	g = cn.g ;
	n = Sg ;
	p = P3 ;
	adv = cn.adv ; 
	preap = cn.preap ;
	postap = cn.postap ;
      };

    UseN n = -- N -> CN
  lin CN ( n ** {preap, postap = {s = \\_ => "" } ; adv = ss "" }) ; -- massable = n.massable } ) ; 
      
      UseN2 n2 = -- N2 -> CN
  lin CN ( n2 ** {preap, postap = {s = \\_ => "" } ; adv = ss "" }) ; -- massable = n2.massable } ) ; 
  -----b    UseN3 n = n ;
--
--    Use2N3 f = {
--      s = \\n,c => f.s ! n ! Nom ;
--      g = f.g ;
--      c2 = f.c2
--      } ;
--
--    Use3N3 f = {
--      s = \\n,c => f.s ! n ! Nom ;
--      g = f.g ;
--      c2 = f.c3
--      } ;
--
--    ComplN2 f x = {s = \\n,c => f.s ! n ! Nom ++ f.c2 ++ x.s ! c ; g = f.g} ;
--    ComplN3 f x = {
--      s = \\n,c => f.s ! n ! Nom ++ f.c2 ++ x.s ! c ;
--      g = f.g ;
--      c2 = f.c3
--      } ;

  param
    AdjPos = Pre | Post ;
  lin
    AdjCN ap cn =  -- AP -> CN -> CN
      let pos = variants { Post ; Pre }
      in
      {
	-- s = \\n,c => preOrPost ap.isPre (ap.s ! cn.g ! n ! c) (cn.s ! n ! c) ;
	-- s = \\n,c => ( cn.s ! n ! c ) ++ ( ap.s ! AdjPhr cn.g n c) ; -- always add adjectives after noun?
	s = cn.s ;
	postap = case pos of { Pre => cn.postap ; Post => { s = \\a => ap.s ! a ++ cn.postap.s ! a } } ;
	preap = case pos of { Pre => { s = \\a => ap.s ! a ++ cn.preap.s ! a } ; Post => cn.preap } ;
	-- variants { postap = ConsAP postap ap ; preap = ConsAP preap ap } ; -- Nice if that would work
	g = cn.g ;
	adv = cn.adv 
--	massable = cn.massable
      } ;

--    RelCN cn rs = {
--      s = \\n,c => cn.s ! n ! c ++ rs.s ! agrgP3 n cn.g ;
--      g = cn.g
--      } ;

--    AdvCN cn ad = {s = \\n,c => cn.s ! n ! c ++ ad.s ; g = cn.g} ;

--    SentCN cn sc = {s = \\n,c => cn.s ! n ! c ++ sc.s ; g = cn.g} ;
    --
    -- ApposCN : CN -> NP -> CN
    ApposCN cn np = {s = \\n,c => cn.s ! n ! c ++ np.s ! c ; g = cn.g ; preap = cn.preap ; postap = cn.postap ; adv = cn.adv } ; -- massable = cn.massable } ;
--
}
