wgs@cougar:/data/archive/ARCHANA/All_my_van_fastqc_txt/batch3_myvan_fastqc_result$ more progToReadFile.sh
**************code start *****************

#!/bin/bash

# Shell to read source file and copy it to target file. If the file
# is copied successfully then give message 'File copied successfully'
# else give message 'problem copying file'

SRC_DIR=$PWD/srcDir_fastqc
DEST_DIR=$PWD/destDir_fastqc
DIR_LIST="dirList_fastqc.txt"    #File which contain list of all directory
echo `ls $SRC_DIR > $DIR_LIST`

#Read the directoryname from file dirList.txt and then copy the source file from source to destination
while read line; do 
	dirName4File=$(echo $line)
	echo $dirName4File


# copy file 
cp $SRC_DIR/$dirName4File/fastqc_data.txt $DEST_DIR/$dirName4File.txt

# store exit status of above cp command. It is use to 
# determine  if shell command operations is successful or not
status=$?
 
if [ $status -eq 0 ]
then
	echo 'File copied successfully'
else
	echo 'Problem copuing file'
fi

done < $DIR_LIST 
