use strict;
use warnings;
use Switch;
use Data::Dumper;
our %LEX;
our %TEST;
sub adjective
{
    my ($FORM,$LEMMA,$FEATS) =@_;
    $TEST{$FORM} = 1;
    if ($LEMMA =~ /us$/) { $LEX{"mkA \"$LEMMA\";"} = "_A"; }
    elsif ($LEMMA =~ /(?<stem>.*)is$/) { $LEX{"mkA \"$LEMMA\" \"".$+{stem}."e\";"} = "_A"; }
    else { print "missing case for $LEMMA $FORM\n"; }
}

sub noun
{
}

sub verb
{

}

sub pronoun 
{

}

sub preposition 
{

}

sub adverb
{

}

# Main
{
    if (scalar(@ARGV)==0)
    {
	die "CONLL file needed as parameter\n";
    }
    my $conllfile = $ARGV[0];
    open my $conllfh, "<", $conllfile;
    while (my $line = <$conllfh>)
    {
	chomp $line;
	my ($ID,$FORM,$LEMMA,$CPOSTAG,$POSTAG,$FEATS,$HEAD,$DEPREL,$PHEAD,$PDEPREL)=split /\s/,$line;
	switch ($POSTAG) {
	    case "A-" { adjective($FORM,$LEMMA,$FEATS) } # adjective
	    case "Df" { adverb($LEMMA) } # adverb
#	    case "S-" {} # article
#	    case "Ma" {} # cardinal numeral
	    case "Nb" { noun($FORM,$LEMMA,$FEATS) } # common noun
#	    case "C-" {} # conjunction
	    case "Pd" { pronoun($FORM,$LEMMA,$FEATS) } # demonstrative pronoun
#	    case "F-" {} # foreign word
	    case "Px" { pronoun($FORM,$LEMMA,$FEATS) } # indefinite pronoun
#	    case "N-" {} # infinitive marker
#	    case "I-" {} # interjection
	    case "Du" { adverb($LEMMA) } # interrogative adverb
	    case "Pi" { pronoun($FORM,$LEMMA,$FEATS) } # interrogative pronoun
#	    case "Mo" {} # ordinal numeral
	    case "Pp" { pronoun($FORM,$LEMMA,$FEATS) } # personal pronoun
	    case "Pk" { pronoun($FORM,$LEMMA,$FEATS) } # personal reflexive pronoun
	    case "Ps" { pronoun($FORM,$LEMMA,$FEATS) } # possessive pronoun
	    case "Pt" { pronoun($FORM,$LEMMA,$FEATS) } # possessive reflexive pronoun
	    case "R-" { preposition($LEMMA) } # preposition
	    case "Ne" { noun($FORM,$LEMMA,$FEATS) } # proper noun
#	    case "Py" {} # quantifier
#	    case "Pc" {} # reciprocal pronoun
	    case "Dq" { adverb($LEMMA) } # relative adverb
	    case "Pr" { pronoun($FORM,$LEMMA,$FEATS) } # relative pronoun
	    case "G-" { adverb($LEMMA) } # subjunction
	    case "V-" { verb($FORM,$LEMMA,$FEATS) } # verb
#	    case "X-" {} # unassigned
	}
    }
#    print Dumper(%TEST);
}
    
