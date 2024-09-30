#!/bin/bash
for file in $(grep '' test.txt)
do
    echo $file
done

#!/bin/bash
# while read -r row; do echo "${row}_5566"; done < test.txt
while read -r row
do
  echo "${row}_5566"
done < test.txt

counter=1
while read -r line; do
  echo "${line}${counter}"
  counter=$((counter + 1))
done < test.txt


#!/bin/bash
while IFS= read -r fileName
do
  echo "$fileName"
done < test.txt

The shellcheck warning SC2013 is advising
you to read lines from file_list.txt in a way
that properly handles spaces or special characters in filenames.
The current approach, for file in $(grep '' file_list.txt),
will break if any filenames in file_list.txt
contain spaces or special characters.
The recommended method is to use a while read loop to correctly handle each line separately.

while IFS= read -r file: Reads each line of the file file_list.txt into the variable file.
IFS=: Temporarily sets the internal field separator to an empty value, preventing leading/trailing whitespace from being trimmed.
-r: Prevents backslashes from being interpreted as escape characters.
< file_list.txt: Redirects the content of file_list.txt as input to the while loop.
This approach ensures each line is read correctly, including lines with spaces or special characters.