clear
ans=0
o="y"

echo "Enter the first no:"
read n1
echo "Enter the second no:"
read n2

while [ $o != "n" ]
do
echo "Enter your choice"
echo "1. Addition"
echo "2. Substraction"
echo "3. Multiplication"
echo "4. Division"
read ch
if [ $ch = "1" ]
then
 ans=$((n1 + n2))
 echo "result "$ans
elif [ $ch = "2" ]
then
 ans=$((n1 - n2))
 echo "result "$ans
elif [ $ch = "3" ]
then
 ans=$((n1 * n2))
 echo "result "$ans
else :
 ans=$((n1 / n2))
 echo "result "$ans
  
fi
echo "Do you want to continue?(y/n)"
read o
if [ $o == "n" ]
then 
 exit
fi
 done

