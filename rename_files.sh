#!/bin/bash

echo "sample-id,filename,direction" > MANIFEST

for f in *_1.fastq.gz; do
    # SRR 번호 추출
    RUN_ACCESSION="${f%_1.fastq.gz}"
    
    # 파일명 변경
    mv "${RUN_ACCESSION}_1.fastq.gz" "${RUN_ACCESSION}_S0_L001_R1_001.fastq.gz"
    mv "${RUN_ACCESSION}_2.fastq.gz" "${RUN_ACCESSION}_S0_L001_R2_001.fastq.gz"
    
    # MANIFEST에 추가
    echo "${RUN_ACCESSION},${RUN_ACCESSION}_S0_L001_R1_001.fastq.gz,forward" >> MANIFEST
    echo "${RUN_ACCESSION},${RUN_ACCESSION}_S0_L001_R2_001.fastq.gz,reverse" >> MANIFEST
    
    echo "✅ ${RUN_ACCESSION} 완료"
done

echo "🎉 완료! MANIFEST 확인:"
cat MANIFEST
