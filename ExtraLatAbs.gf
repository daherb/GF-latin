abstract ExtraLatAbs =
	 Extra,
	 ExtraLexiconLatAbs **
{
  fun
    UsePronNonDrop : Pron -> NP ; 

    
    -- Some empty prepositions to enforce cases
    to_Prep : Prep;
    Nom_Prep :Prep;
    Gen_Prep :Prep;
    Acc_Prep :Prep;
    Dat_Prep :Prep;
    Abl_Prep :Prep;
}
