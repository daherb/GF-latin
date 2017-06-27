concrete StructuralLat of Structural = CatLat ** 
  open ResLat, ParadigmsLat, Prelude, IrregLat, ConstructX, ExtraLat in 
  {
    
  flags optimize=all ;
	
  lin
  above_Prep = mkPrep "super" Abl ; -- abl. L...
  after_Prep = mkPrep "post" Acc ; -- acc. L...
  all_Predet = ss "cuncti" ; -- L...
  almost_AdA, almost_AdN = ss "quasi" ; -- L...
  although_Subj = ss "quamquam" ; -- L...
  always_AdV = ss "semper" ; -- L...
  and_Conj = mkConj [] "et" Pl And ; -- L...
-----b  and_Conj = ss "and" ** {n = Pl} ;
  because_Subj = ss "cum" ; -- L...
  before_Prep = mkPrep "ante" Acc ; -- acc. L...
  behind_Prep = mkPrep "a tergo" Acc ; -- acc. L...
  between_Prep = mkPrep "inter" Acc ; -- acc. L...
  both7and_DConj = mkConj "et" "et" Pl And; --L...
  but_PConj = ss "sed" ; -- L...
  by8agent_Prep = mkPrep "per" Abl ; -- L...
  by8means_Prep = Abl_Prep ; -- L...
  can8know_VV, can_VV = mkVV IrregLat.can_V True ; --L...
  during_Prep = mkPrep "inter" Acc ; -- L...
  either7or_DConj = mkConj "aut" "aut" Sg Or ; -- L...
  everybody_NP = regNP  "quisque" "quemque" "cuiusque" "cuique" "quoque" "quisque" ( Masc | Fem ) Sg ;-- regNP "quisquae" Sg ; -- L...
  every_Det = mkDeterminer ( mkA "omnis" ) Pl ; -- Pons
  everything_NP = regNP "omnia" "omnia" "omnium" "omnis" "omnis" "omnia" Neutr Pl ; --regNP "omnia" Pl ; -- L...
  everywhere_Adv = ss "ubique" ; -- L...
  few_Det = mkDeterminer ( mkA "paulus" ) Pl ; -- L...
-----  first_Ord = ss "first" ; DEPRECATED
  for_Prep = mkPrep "pro" Abl ; -- abl. L...
  from_Prep = mkPrep "de" Abl ; -- abl. L...
  he_Pron = mkPronoun Masc Sg P3 ;
  here_Adv = ss "hic" ; -- L...
  here7to_Adv = ss "huc" ; -- L...
  here7from_Adv = ss "hinc" ; -- L...
  how_IAdv = ss "qui" ; -- L...
  how8many_IDet = mkDeterminer (mkA "quantus" ) Pl ; -- Pons
  how8much_IAdv = ss "quantum" ; -- L...
  if_Subj = ss "si" ; -- L...
  in8front_Prep = mkPrep "ante" Acc ; -- acc. L...
  i_Pron = mkPronoun Masc Sg P1 ;
  in_Prep = mkPrep "in" ( variants { Abl ; Acc } ) ; -- L...
  it_Pron = mkPronoun Neutr Sg P3 ; 
  less_CAdv = mkCAdv "minus" "quam" ; -- L...
  many_Det = mkDeterminer ( mkA "multus" ) Pl ; -- L...
  more_CAdv = mkCAdv "magis" "quam" ; -- L...
  most_Predet = ss "plurimi" ; -- L...
  much_Det = mkDeterminer ( mkA "multus" ) Sg ; -- L...
  must_VV = mkVV ( mkV "debere" ) True ; -- L...
-----b  no_Phr = ss "immo" ;
  no_Utt = ss "non est" ; -- should be expressed by a short negated sentence L...
  on_Prep = mkPrep "in" ( Acc | Abl ) ; -- L...
------  one_Quant = mkDeterminer Sg "one" ; -- DEPRECATED
  only_Predet = ss "solum" ; -- L...
  or_Conj = mkConj [] "aut" Sg Or ; -- L...
  otherwise_PConj = ss "praeterea" ; -- Pons
  part_Prep = mkPrep [] Gen ; -- Bayer-Lindauer 127
  please_Voc = ss "queso" ; -- L...
  possess_Prep = mkPrep [] Gen ; -- Bayer-Lindauer 125.2
  quite_Adv = ss "admodum" ; -- or by comparation L...
  she_Pron = mkPronoun Fem Sg P3 ;
  so_AdA = ss "sic" ; -- L...
  somebody_NP = regNP "aliquis" "aliquem" "alicuius" "clicui" "aliquo" "aliquis" ( Masc | Fem ) Sg ; -- Bayer-Lindauer 60.1
  someSg_Det = mkDeterminer ( mkA "aliquis" ) Sg ; -- L...
  somePl_Det = mkDeterminer ( mkA "nonnullus" ) Pl ; --L ...
  something_NP = regNP "aliquid" "aliquid" "alicuius rei" "alicui rei" "aliqua re" "aliquid" Masc Sg ; -- Bayer-Lindauer 60.1
  somewhere_Adv = ss "usquam" ; -- L...
  that_Quant = ille_Quantifier ;
  that_Subj = ss "ut" ; -- L...
  there_Adv = ss "ibi" ; -- loc. L...
  there7to_Adv = ss "eo" ; -- Pons
  there7from_Adv = ss "inde" ; -- Pons
  therefore_PConj = ss "ergo" ; -- L...
  they_Pron = mkPronoun Masc Pl P3 ;
  this_Quant = hic_Quantifier ;
  through_Prep = mkPrep "per" Acc ; -- L...
  too_AdA = ss "quoque" ; -- L...
  to_Prep = mkPrep "ad" Acc; -- L...
  under_Prep = mkPrep "sub" Acc ; -- L...
  very_AdA = ss "valde" ; -- L...
  want_VV = mkVV IrregLat.want_V True ; -- L...
  we_Pron = mkPronoun Masc Pl P1 ;
  whatSg_IP = { s =pronForms "quid" "quid" "cuius" "cui" "quo" ; n = Sg } ; -- only feminine or masculine Bayer-Lindauer 59.1
  whatPl_IP = { s = \\_ => "" ; n = Pl } ; -- no plural forms Bayer-Lindauer 59.1
  when_IAdv = ss "quando" ; -- L...
  when_Subj = ss "si" ; -- L...
  where_IAdv = ss "ubi" ; -- L...
  which_IQuant = -- Bayer-Lindauer 59.1.2 and 58.1
    { s = table { 
	Ag Masc  Sg c => ( pronForms "qui" "quem" "cuius" "cui" "quo" ) ! c ;
	Ag Masc  Pl c => ( pronForms "qui" "quos" "quorum" "quibus" "quibus" ) ! c ;
	Ag Fem   Sg c => ( pronForms "quae" "quam" "cuius" "cui" "qua" ) ! c ;
	Ag Fem   Pl c => ( pronForms "quae" "quas" "quarum" "quibus" "quibus" ) ! c ;
	Ag Neutr Sg c => ( pronForms "quod" "quod" "cuius" "cui" "quo" ) ! c ;
	Ag Neutr Pl c => ( pronForms "quae" "quae" "quorum" "quibus" "quibus" ) ! c
	}
    } ;
-----b  whichPl_IDet = mkDeterminer Pl ["which"] ;
-----b  whichSg_IDet = mkDeterminer Sg ["which"] ;
  whoSg_IP = { s =pronForms "quis" "quem" "cuius" "cui" "quo" ; n = Sg } ; -- only feminine or masculine Bayer-Lindauer 59.1
  whoPl_IP = { s = \\_ => "" ; n = Pl } ; -- no plural forms Bayer-Lindauer 59.1

  why_IAdv = ss "cur" ; -- L...
  without_Prep = mkPrep "sine" Abl ; -- abl. L..
  with_Prep = mkPrep "cum" Abl ; -- abl. L..
  yes_Utt = ss "sane" ; -- L...
  youSg_Pron = mkPronoun Masc Sg P2 ;
  youPl_Pron = mkPronoun Masc Pl P2 ;
  youPol_Pron = youSg_Pron | youPl_Pron ;

  no_Quant = { s , sp = ( mkA "nullus" ).s ! Posit } ; -- nullus L... 
  not_Predet = ss "non" ; -- L...
  if_then_Conj = mkConj "si" [] Sg If ; -- no word in s2 field L... 
  at_least_AdN = ss "saltem" ; -- L...
  at_most_AdN = ss "summum" ; -- Pons
  nobody_NP = regNP "nemo" "neminem" "neminis" "nemini" "nemine" "nemo" ( Masc | Fem ) Sg ; -- Bayer Lindauer 60.4
  nothing_NP = regNP "nihil" "nihil" "nullius rei" "nulli rei" "nulla re" "nihil" Neutr Sg ; -- Bayer-Lindauer 60.4
  except_Prep = mkPrep "praeter" Acc ; -- L...

  as_CAdv = mkCAdv "ita" "ut" ; -- L ...

  have_V2 = mkV2 (mkV "habere") ; -- habeo, -ui, -itum 2 (Langenscheidts)

  lin language_title_Utt = ss "lingua latina" ;

}

