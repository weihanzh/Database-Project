lines = LOAD '/root/in/{para1.txt,para2.txt,para3.txt,para4.txt,para5.txt,para6.txt}' AS (line:chararray);
letters = FOREACH lines generate flatten(TOKENIZE(REPLACE(LOWER(line),'','。'), '。')) as letter;
characters = filter letters by letter MATCHES '[aeiou]';
A = group characters by letter;
count = FOREACH A generate group, COUNT(characters);
store count into 'countChars_Bonus';