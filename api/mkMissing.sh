#!/bin/sh
echo "Create tmp dir"
mkdir tmp/
echo "Remove old file"
rm ../MissingLat.gf
echo "Look for missing functions"
# gf -src -i .. -batch TryLat.gf 2>&1 | grep "Warning: no linearization of" | sort -u > tmp/MissingLat.tmp
gf -src -i .. -batch TryLat.gf 2>&1 | grep -E "constant not found|no linearization of" | sort -u > tmp/MissingLat.tmp
echo "Compile grammar"
gf -src -make -i . -D tmp ../LangLat.gf 
echo "Create placeholders for missing functions"
echo "resource MissingLat = open GrammarLat, Prelude in {" > ../MissingLat.gf
echo "" >> ../MissingLat.gf
echo "-- temporary definitions to enable the compilation of RGL API" >> ../MissingLat.gf
runghc mkMissing.hs >> ../MissingLat.gf
echo "}" >> ../MissingLat.gf
echo "Cleanup"
rm -Rf tmp