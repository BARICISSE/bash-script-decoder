#! /bin/bash

string3=$(while read line; do echo "$line"; done < $1)


codebook=`echo $string3 | cut -f1 -d" " `
echo $codebook
codebook2=`echo $string3 | cut -f2 -d" " `
echo $codebook2
string1=abcdefghijklmnopqrstuvwxyz
String2=ABCDEFGHIJKLMNOPQRSTUVWXYZ

input=$(cat $2)



for ((i=0; i<${#input}; i++))
 do
  var="${input:$i:1}"
  
   x=${codebook%%$var*};
   rank="$((${#x}+1))"
   
if [[ $var == [[:alpha:]] ]] 
then 
    if [[ $var =~ [A-Z] ]] 
    then 
  
    b=${codebook2%%$var*};
    rank="$((${#b}+1))"
    ans+=$"`expr substr "$String2" $rank 1`"
    else 
     ans+=$"`expr substr "$string1" $rank 1`"
     fi
else
m=$var
ans+="$m"
fi
done
echo $ans