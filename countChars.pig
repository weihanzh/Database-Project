lines = LOAD '/root/in/{para1.txt,para2.txt,para3.txt,para4.txt,para5.txt,para6.txt}' AS (line:chararray);
letters = FOREACH lines generate flatten(TOKENIZE(REPLACE(LOWER(line),'','。'), '。')) as letter;
A = group letters by letter;
count = FOREACH A generate group, COUNT(letters);
store count into 'charcount';