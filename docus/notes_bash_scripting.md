# comments 

! '
multi
line 
comment
'

variables
=====
declaration => name=value
call => $variable

increment => variable =$(( variable+1 ))
conditions
=====

if [ $vriable -eq $val ]
then
	# execution code
fi

-eq => ===
-ne => !=
-gt => >
-lt => <
-ge => >=

if (( $var > $val ))
then
	# execution code
elif [ condition ] && [ condition ]
# elif (( condition && condition ))
then
	# execution code
else
	# execution code
fi

-o ||

[ condition -o condition ]
[[ condition || condition ]]

loops
=====

while [ $number -lt 10 ]
do
	# exec
done

until [ $number -ge 10 ]
do
	# exec
done

for i in 1 2 3 4 5
do 
	# exec
done

for i in {0...10}
do
	# exec
done

for i in {0...10...2}
do
	# exec
done

for (( i=0; i<5: i++ ))
do
	# exec
done

quit the loop => break
skip the turn => continue

input
====




