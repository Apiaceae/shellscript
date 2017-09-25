#! /bin/bash

# Using GMYC for species delineation
# https://francoismichonneau.net/gmyc-tutorial/

#在shell开始处，
START_TIME=`date +%s`

# run your programm
cd /home/lisong/phylo/beast/gmyc/yule/
/usr/local/beast/bin/beast yule.xml

#在shell结尾处
END_TIME=`date +%s`

EXECUTING_TIME=`expr $END_TIME - $START_TIME`
EXECUTING_TIME_MINUTE=`expr $EXECUTING_TIME / 60`
EXECUTING_TIME_HOUR=`expr $EXECUTING_TIME / 3600`

# echo $EXECUTING_TIME with minute or hour measure
# example: echo "这里是正文" | mutt -s "这里是标题" my@163.com

if [ $EXECUTING_TIME_HOUR -gt 1 ]
then
	echo "GMYC analysis finished with" $EXECUTING_TIME_HOUR "hour!" | mutt -s "GMYC finished!" lswang@ibcas.ac.cn
else 
	echo "GMYC analysis finished with" $EXECUTING_TIME_MINUTE "minute!" | mutt -s "GMYC finished!" lswang@ibcas.ac.cn
fi

# send email with attached files
# echo "treeannotator Run Complete!" | mutt -s "treeannotator finished!" -a /home/lisong/phylo/beast/run1/pter1_tree.nex lswang@ibcas.ac.cn

