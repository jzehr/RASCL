# =============================================================================
# IMPORTANT!
# Run this in the Ubuntu subsystem
# =============================================================================


# =============================================================================
# Test 1
# Test tn93-cluster.py
# =============================================================================
python3 tn93_cluster.py  --input ../results/Example1/S.query.msa.SA --output_fasta S.query.compressed.fas --output_json S.query.json --threshold 0.0005 --max_retain 500

# =============================================================================
# Test 2
# Test combine.py
# =============================================================================
python3 combine.py --input ../results/Example1/S.query.compressed.fas -o S.combined.fas --threshold 0.0005 --msa ../results/Example1/S.reference.compressed.fas  --reference_seq ../data/ReferenceSeq/S.fas

# =============================================================================
# Test 3
# Test generate-report.py
# =============================================================================

BASEDIR="/mnt/e/RASCL-revision"
TAG="Example1"

DATA_DIR="$BASEDIR"/results/"$TAG"

# Static settings
REF_TAG="REFERENCE"
ANNOTATION_JSON="$TAG"_annotation.json
SUMMARY_JSON="$TAG"_summary.json

for file in "$DATA_DIR"/*.combined.fas; do
   echo ""
   echo python3 generate-report.py -f $file -A $ANNOTATION_JSON -S $SUMMARY_JSON -r "$REF_TAG"
   python3 generate-report.py -f $file -A $ANNOTATION_JSON -S $SUMMARY_JSON -r "$REF_TAG"
done


# =============================================================================
# End of file 
# =============================================================================
