use strict;
use warnings;
use Switch;
use File::Basename;
use Data::Dumper;

our %LEX;
our %TEST;

sub to_hash
{
    my ($POSTAG,$FORM,$LEMMA,$FEATS) = @_;
    if(!defined($LEX{$LEMMA}{$POSTAG}{$FEATS}{$FORM}))
    {
	$LEX{$LEMMA}{$POSTAG}{$FEATS}{$FORM} = 1;
    }
    else
    {
	$LEX{$LEMMA}{$POSTAG}{$FEATS}{$FORM}++;
    }
}

sub to_gf_lex
{
    my ($abslexfh,$conclexfh) = @_;
    my $count = 0;
    foreach my $LEMMA (keys %LEX)
    {
	foreach my $POSTAG (keys %{$LEX{$LEMMA}})
	{
	    my @FEATS = keys %{$LEX{$LEMMA}{$POSTAG}};
	    #my @FORMS = keys %{$LEX{$LEMMA}{$POSTAG}{$FEATS}};
	    my @FORMS;
	    foreach my $FEAT (keys %{$LEX{$LEMMA}{$POSTAG}})
	    {
		foreach my $FORM (keys %{$LEX{$LEMMA}{$POSTAG}{$FEAT}})
		{
		    push @FORMS, $FORM;
		}
	    }
	    switch ($POSTAG) {
		case "A-" { adjective($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # adjective
		case "Df" { adverb($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # adverb
		#	    case "S-" {} # article
		#	    case "Ma" {} # cardinal numeral
		case "Nb" { noun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # common noun
		#	    case "C-" {} # conjunction
		case "Pd" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # demonstrative pronoun
		#	    case "F-" {} # foreign word
		case "Px" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # indefinite pronoun
		#	    case "N-" {} # infinitive marker			#	    case "I-" {} # interjection
		case "Du" { adverb($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # interrogative adverb
		case "Pi" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # interrogative pronoun
		#	    case "Mo" {} # ordinal numeral
		case "Pp" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # personal pronoun
		case "Pk" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # personal reflexive pronoun
		case "Ps" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # possessive pronoun
		case "Pt" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # possessive reflexive pronoun
		case "R-" { preposition($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # preposition
		case "Ne" { noun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # proper noun
		#	    case "Py" {} # quantifier
		#	    case "Pc" {} # reciprocal pronoun
		case "Dq" { adverb($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # relative adverb
		case "Pr" { pronoun($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # relative pronoun
		case "G-" { adverb($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # subjunction
		case "V-" { verb($LEMMA,\@FEATS,\@FORMS,$abslexfh,$conclexfh,\$count) } # verb
		#	    case "X-" {} # unassigned
	    }
	}
    }
}

sub adjective    
{
    my ($LEMMA,$FEATS,$FORMS,$abslexfh,$conclexfh,$count) = @_ ;
    if ($LEMMA =~ /(us|er)$/) {  print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" ;\n";  }
    elsif ($LEMMA =~ /(?<stem>.*)is$/) { print $conclexfh  "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."e\" ;\n" ; }
    elsif ($LEMMA =~ /(?<stem>.*)ns$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."ntis\" ;\n" ; }
#    elsif ($LEMMA =~ /(?<stem>.*[^e])r$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."ris\" ;\n" ; } # prior, memor, interior, deterior, par, victor, ulterior, immemor broken. to fix 
#    elsif ($LEMMA =~ /(?<stem>.*)rs$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."rtis\" ;\n" ; } # iners, expers, misericors broken. to fix
    elsif ($LEMMA =~ /(?<stem>.*)x$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."cis\" ;\n"; }
    else { print "missing case for Adjective $LEMMA - ".join(", ",@$FORMS)."\n"; return }
    print $abslexfh "\tlex".$$count."_A : A ;\n";
    foreach my $FORM (@$FORMS) { $TEST{$FORM} = 1 };
    $$count++;
}

sub noun
{
    my ($LEMMA,$FEATS,$FORMS,$abslexfh,$conclexfh,$count) = @_;
    if ($LEMMA =~ /(us|a|um)$/) {  print $conclexfh "\tlex".$$count."_N = mkN \"$LEMMA\" ;\n";  }
#    elsif ($LEMMA =~ /(?<stem>.*)a$/) { print $conclexfh  "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."e\";\n" ; }
    # elsif ($LEMMA =~ /(?<stem>.*)ns$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."ntis\";\n" ; }
    # elsif ($LEMMA =~ /(?<stem>.*)r$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."ris\";\n" ; }
    # elsif ($LEMMA =~ /(?<stem>.*)rs$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."rtis\";\n" ; }
    # elsif ($LEMMA =~ /(?<stem>.*)x$/) { print $conclexfh "\tlex".$$count."_A = mkA \"$LEMMA\" \"".$+{stem}."cis\";\n"; }
    else { print "missing case for Noun $LEMMA - ".join(", ",@$FORMS)."\n"; return }
    print $abslexfh "\tlex".$$count."_N : N ;\n";
    $$count++;
}

sub verb
{
    my ($LEMMA,$FEATS,$FORMS,$abslexfh,$conclexfh,$count) = @_;
}

sub pronoun 
{
    my ($LEMMA,$FEATS,$FORMS,$abslexfh,$conclexfh,$count) = @_;
}

sub preposition 
{
    my ($LEMMA,$FEATS,$FORMS,$abslexfh,$conclexfh,$count) = @_;
}

sub adverb
{
    my ($LEMMA,$FEATS,$FORMS,$abslexfh,$conclexfh,$count) = @_;
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
	next if ($line eq "");
	my ($ID,$FORM,$LEMMA,$CPOSTAG,$POSTAG,$FEATS,$HEAD,$DEPREL,$PHEAD,$PDEPREL) = split /\s/,$line;
	to_hash($POSTAG,$FORM,$LEMMA,$FEATS)
    }
    my ($conllname,$conllpath,$conllsuffix) = fileparse($conllfile, qr/\.[^.]*/);
    $conllname =~ s/\W//g;
    open my $abslexfh, ">", $conllname."Abs.gf";
    open my $conclexfh, ">", $conllname.".gf";
    print $abslexfh "abstract ".$conllname."Abs = Cat ** open Cat in {\nfun\n";
    print $conclexfh "concrete $conllname of ".$conllname."Abs = CatLat ** open ParadigmsLat,Prelude,ParamX in {\nlin\n";
    to_gf_lex($abslexfh,$conclexfh);
    print $abslexfh "}\n";
    print $conclexfh "}\n";
    close $abslexfh;
    close $conclexfh;
    open my $testfh, ">", $conllname."Test.gfs";
    print $testfh "i $conllname.gf\n";
    foreach my $t (keys %TEST)
    {
	print $testfh "ma -missing \"$t\"\n";
    }
    close $testfh;
    #    print Dumper(%TEST);
}

