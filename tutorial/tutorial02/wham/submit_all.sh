for f in *.chk; do
    name=${f/.chk/}
    cp template.sh ${name}.sh
    sed -i "s/NAME/${name}/" ${name}.sh
    sbatch ${name}.sh
    rm ${name}.sh
done
