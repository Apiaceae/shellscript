#! /bin/bash

#在shell开始处，
START_TIME=`date +%s`

# run your programm
cd /home/lisong/phylo/beast/run1/

# treeannotator 意外终止的问题
/usr/local/beast/bin/treeannotator -b 10 pter1.trees pter1_tree.nex


#在shell结尾处
END_TIME=`date +%s`s

EXECUTING_TIME=`expr $END_TIME - $START_TIME`
EXECUTING_TIME_MINUTE=`expr $EXECUTING_TIME / 60`
EXECUTING_TIME_HOUR=`expr $EXECUTING_TIME / 3600`

# echo $EXECUTING_TIME with minute or hour measure
# example: echo "这里是正文" | mutt -s "这里是标题" my@163.com

if [ $EXECUTING_TIME_HOUR -gt 1 ]
then
	echo "Treeannotator run complete with $EXECUTING_TIME_HOUR hour!" | mutt -s "treeannotator finished!" lswang@ibcas.ac.cn
else 
	echo "Treeannotator run complete with $EXECUTING_TIME_MINUTE minute!" | mutt -s "treeannotator finished!" lswang@ibcas.ac.cn
fi

# send email with attached files
# echo "treeannotator Run Complete!" | mutt -s "treeannotator finished!" -a /home/lisong/phylo/beast/run1/pter1_tree.nex lswang@ibcas.ac.cn

