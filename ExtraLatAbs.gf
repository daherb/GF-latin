abstract ExtraLatAbs =
	 Extra,
	 ExtraLexiconLatAbs **
  {
    cat CS ;
  fun
    useS : S -> CS ;
    -- do not drop pronouns
    UsePronNonDrop : Pron -> NP ;
    
    -- Some empty prepositions to enforce cases
    Nom_Prep :Prep;
    Gen_Prep :Prep;
    Acc_Prep :Prep;
    Dat_Prep :Prep;
    Abl_Prep :Prep;
}
