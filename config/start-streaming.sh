./start-hadoop.sh

hdfs dfs -put /root/data_set.csv /data_set.csv

hdfs dfs -rm -r /output

hadoop jar hadoop-streaming.jar -file mapper.py -mapper "python mapper.py" -file reducer.py -reducer "python reducer.py" -input /data_set.csv -output /output

hdfs dfs -cat /output/part-00000
