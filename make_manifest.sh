FASTQ_DIR="/home/stellaaa/data/project/260304_Microbiome/SRR3202919/Data/Input_data"
OUTPUT="MANIFEST"

echo "sample-id,absolute-filepath,direction" > $OUTPUT

for R1 in ${FASTQ_DIR}/*_R1*.fastq.gz; do
    SAMPLE=$(basename $R1 | sed 's/_R1.*//')
    R2=${R1/_R1/_R2}
    
    echo "${SAMPLE},${R1},forward" >> $OUTPUT
    
    if [ -f "$R2" ]; then
        echo "${SAMPLE},${R2},reverse" >> $OUTPUT
    fi
done

echo "완료: $OUTPUT"