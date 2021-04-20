chknames=(t000 t001 t002 t003 t004 t005 t006 t007 t008 t009)
#chknames=(t008 t009)

#chknames=(t000 t001 t002 t003 t004 t005 t006 t007 t008 t009 t010 t011 t012 t013 t014 t015 t016 t017 t018 t019 t020 t021 t022 t023 t024 t025 t026 t027 t028 t029 t030 t031 t032 t033 t034 t035 t036 t037 t038 t039)
#chknames=(t011 t013 t015 t016 t017 t021 t022 t023 t025 t026 t027 t028 t029 t030 t031 t032 t033 t034 t036 t037 t038 t039)
#chknames=(t020 t021 t022 t023 t024 t025 t026 t027 t028 t029 t030 t031 t032 t033 t034 t035 t036 t037 t038 t039)

for name in ${chknames[@]}; do
    cp template.sh ${name}-f.sh
    sed -i "s/NAME/${name}-f/" ${name}-f.sh
    echo "Submitting ${name}-f"
    sbatch ${name}-f.sh
    rm ${name}-f.sh

    if [ -f ${name}-r.chk ]; then
        cp template.sh ${name}-r.sh
        sed -i "s/NAME/${name}-r/" ${name}-r.sh
        echo "Submitting ${name}-r"
        sbatch ${name}-r.sh
        rm ${name}-r.sh
    fi
done
