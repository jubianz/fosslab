#!/bin/bash
$(pdftotext -layout -nopgbrk result_MDL.pdf result_MDL.txt)
$(grep -A 1 "MDL16CS" result_MDL.txt > cs.txt)
 
 sed -i 's/--//g' cs.txt
 sed -i 's/  //g' cs.txt
 sed -i 's/MA101//g' cs.txt
 sed -i 's/PH100//g' cs.txt
 sed -i 's/BE110//g' cs.txt
 sed -i 's/BE103//g' cs.txt
 sed -i 's/EE100//g' cs.txt
 sed -i 's/PH110//g' cs.txt
 sed -i 's/EE110//g' cs.txt
 sed -i 's/\<CS110\>//g' cs.txt
 sed -i 's/BE10105//g' cs.txt
 sed -i 's/             //g' cs.txt
 
 
tr -d "\n" < cs.txt > cs1.txt

 sed -i 's/MDL16CS/\nMDL16CS/g' cs1.txt
 
 sed -i 's/(O)/10/g' cs1.txt
 sed -i 's/(A+)/9/g' cs1.txt
 sed -i 's/(A)/8.5/g' cs1.txt
 sed -i 's/(B+)/8/g' cs1.txt
 sed -i 's/(B)/7/g' cs1.txt
 sed -i 's/(C)/6/g' cs1.txt
 sed -i 's/(P)/5/g' cs1.txt
 sed -i 's/(F)/0/g' cs1.txt

 sed -i 's/,/ /g' cs1.txt
awk '{ print $1 " " ($2*4 +$3*4 + $4*3 + $5*3 + $6*3 + $7*3 + $8 + $9 + $(10))/23 }' cs1.txt > newcs.txt 

$(pdftotext -layout -nopgbrk result_MDL1.pdf result_MDL1.txt)
$(grep -A 1 "MDL16CS" result_MDL1.txt > cs2.txt)
 

sed -i 's/--//g' cs2.txt
 sed -i 's/  //g' cs2.txt
 sed -i 's/CY100//g' cs2.txt
 sed -i 's/EC100//g' cs2.txt
 sed -i 's/BE100//g' cs2.txt
 sed -i 's/CY110//g' cs2.txt
 sed -i 's/EC110//g' cs2.txt
 sed -i 's/MA102//g' cs2.txt
 sed -i 's/BE102//g' cs2.txt
 sed -i 's/\<CS120\>//g' cs2.txt
 sed -i 's/\<CS100\>//g' cs2.txt
 sed -i 's/             //g' cs2.txt
 
 
tr -d "\n" <cs2.txt>cs3.txt

 sed -i 's/MDL16CS/\nMDL16CS/g' cs3.txt
 
 sed -i 's/(O)/10/g' cs3.txt
 sed -i 's/(A+)/9/g' cs3.txt
 sed -i 's/(A)/8.5/g' cs3.txt
 sed -i 's/(B+)/8/g' cs3.txt
 sed -i 's/(B)/7/g' cs3.txt
 sed -i 's/(C)/6/g' cs3.txt
 sed -i 's/(P)/5/g' cs3.txt
 sed -i 's/(F)/0/g' cs3.txt

 sed -i 's/,/ /g' cs3.txt
awk '{ print $1 " " ($2*4 +$3*4 + $4*3 + $5*1 + $6*1 + $7*4 + $8*3 + $9*3 + $(10))/24 }' cs3.txt> newcs1.txt


$(join -1 1 -2 1 newcs.txt newcs1.txt >result.txt)
awk '{ print $1 " " ($2*23 + $3*24)/(23+24) }' result.txt > result1.txt

$(join --nocheck-order -1 6 -2 1 c4b.txt result.txt > c4_sgpa.txt)
$(join --nocheck-order -1 1 -2 1 c4_sgpa.txt result1.txt > c4b_sgpa.txt) 
