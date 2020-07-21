import argparse, sys, os, subprocess, shutil, re

# usage: python submit.py --exclusive run.py *.chk

parser = argparse.ArgumentParser(prog="submit.py")
parser.add_argument("--partition", "-p", type=str, default="serial_requeue")
parser.add_argument("--time", "-t", type=int, default=10080)
parser.add_argument("--cores", "-c", type=int, default=16)
parser.add_argument("--mem", "-m", type=int, default=2000) # per core, in MB
parser.add_argument("--force", "-F", default=False, action="store_true")
parser.add_argument("--exclusive", default=False, action="store_true")
parser.add_argument("--interval", "-i", type=int, default=10)
parser.add_argument("python", type=str)
parser.add_argument("chks", nargs='+')

args = vars(parser.parse_args(sys.argv[1:]))

try:
    for chk in args["chks"]:
        name = re.sub(".chk", "", chk)

        text = "#!/bin/bash\n"
        text += "#SBATCH -N 1\n"
        text += f"#SBATCH -n {args['cores']}\n"
        text += f"#SBATCH -p {args['partition']}\n"
        text += f"#SBATCH --mem={args['cores']*args['mem'] + 2000}\n"
        text += f"#SBATCH -t {args['time']}\n"
        if args["exclusive"]:
            text += "#SBATCH --exclusive=mcs\n"
        text += f"#SBATCH -J presto_{name}\n\n"
        text += f"python {args['python']} {name}.yaml {chk}"

        with open(f"control_{name}.sh", "w+") as file:
            file.write(text)
        print(f"control_{name}.sh created")

#        # annoyingly, you have to reload conda for w/e reason
#        subprocess.call(['/bin/bash', '-i', '-c', f"source deactivate; source activate openmm; sbatch control_{name}.sh "])

except KeyboardInterrupt as k:
    print("cancelled!")

