echo -e ""
echo -e "\t+----------"
echo -e "\t| Jordi Lladós Segura"
echo -e "\t| Clustering Pairwise Library for Multiple Sequence Alignment Tools"
echo -e "\t+----------"
echo -e ""
echo -e "this script launch t_coffee with additional parameters."

#-clustering must be a float between [0,1]
#-clustering=0.75 (accurate)
#-clustering=0.5 (balanced)
#-clustering=0.25 (fastest)

#INPUT
SEQ=../example/BB11001.tfa
TREE=../example/BB11001.dnd
REF=../example/BB11001.msf

#OUTPUT
FORMAT=msf_aln
ALN=test001.msf

#PARAMETERS
EX=very_fast_triplet
DP=myers_miller_pair_wise

./t_coffee $SEQ -usetree=$TREE -extend_mode=$EX -dp_mode=$DP -outfile=$ALN output=$FORMAT -clustering=0.75
