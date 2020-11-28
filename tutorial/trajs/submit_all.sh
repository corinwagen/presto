for f in traj*.chk; do
    name=${f/.chk/}
    cp template.sh ${name}.sh
    sed -i "s/NAME/${name}/" ${name}.sh
    echo Submitting ${name}
    sbatch ${name}.sh
    rm ${name}.sh
done
