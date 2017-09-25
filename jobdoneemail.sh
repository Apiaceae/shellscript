#! /bin/bash

#在shell开始处，
START_TIME=`date +%s`

# run your programm
cd /home/lisong/phylo/beast/run1/

# treeannotator 意外终止的问题
/usr/local/beast/bin/treeannotator -b 10 pter1.trees pter1_tree.nex


#在shell结尾处
END_TIME=`date +%s`

EXECUTING_TIME=`expr $END_TIME - $START_TIME`
EXECUTING_TIME_MINUTE=`expr $EXECUTING_TIME / 60`
EXECUTING_TIME_HOUR=`expr $EXECUTING_TIME / 3600`

# echo $EXECUTING_TIME with minute or hour measure

if [$EXECUTING_TIME_HOUR -gt 1 ]
then
	echo "treeannotator Run Complete! The job take about hour: " | echo $EXECUTING_TIME_HOUR | mutt -s "treeannotator finished!" lswang@ibcas.ac.cn
else 
	echo "treeannotator Run Complete! The job take about minute: " | echo $EXECUTING_TIME_MINUTE | mutt -s "treeannotator finished!" lswang@ibcas.ac.cn
fi

# send email with attached files
# echo "treeannotator Run Complete!" | mutt -s "treeannotator finished!" -a /home/lisong/phylo/beast/run1/pter1_tree.nex lswang@ibcas.ac.cn

