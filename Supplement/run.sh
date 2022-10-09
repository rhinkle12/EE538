#!/bin/bash
rm c1.log
rm c880_synV1_vpersonal.log
rm parser
gcc -o ./parser readckt.c
#./parser
./parser << EOF
read c1.ckt
lev c1.log
read c3.ckt
lev c3.log
read c4.ckt
lev c4.log
read c17.ckt
lev c17.log
read c880.ckt
lev c880.log
read c880_synV1_v.ckt
lev c880_synV1_vpersonal.log
quit
EOF
echo "
end of test"
equality=$(diff c1.log c1_golden_output.log) 
if [ "$equality" != "" ] 
then
    echo "NOT THE SAME - Bad Circuit: c1"
else
    echo "PASSED"
fi

equality=$(diff c3.log c3_golden_output.log) 
if [ "$equality" != "" ] 
then
    echo "NOT THE SAME - Bad Circuit: c3"
else
    echo "PASSED"
fi

equality=$(diff c4.log c4_golden_output.log) 
if [ "$equality" != "" ] 
then
    echo "NOT THE SAME - Bad Circuit: c4"
else
    echo "PASSED"
fi

equality=$(diff c880.log c880_golden_output.log) 
if [ "$equality" != "" ] 
then
    echo "NOT THE SAME - Bad Circuit: c880"
else
    echo "PASSED"
fi

equality=$(diff c880_synV1_vpersonal.log c880_synV1_v_output.log) 
if [ "$equality" != "" ] 
then
    echo "NOT THE SAME - Bad Circuit: c880_synV1
    "
else
    echo "PASSED"
fi