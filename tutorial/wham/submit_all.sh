for f in equil*.yaml; do
    name=${f/.yaml/}
    cp template.sh ${name}.sh
    sed -i "s/NAME/${name}/" ${name}.sh
    sbatch ${name}.sh
    rm ${name}.sh
done
