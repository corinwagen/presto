import argparse, sys, os, subprocess, shutil

# usage: python submit.py -F -p jacobsen2 equil-000 equilibrate.py 2-pentyl-sm.xyz dioxane 40

parser = argparse.ArgumentParser(prog="submit.py")
parser.add_argument("--partition", "-p", type=str, default="serial_requeue")
parser.add_argument("--time", "-t", type=int, default=10080)
parser.add_argument("--cores", "-c", type=int, default=16)
parser.add_argument("--mem", "-m", type=int, default=2000) # per core, in MB
parser.add_argument("--force", "-F", default=False, action="store_true")
parser.add_argument("--exclusive", default=False, action="store_true")
parser.add_argument("--interval", "-i", type=int, default=10)
parser.add_argument("name", type=str)
parser.add_argument("python", type=str)
parser.add_argument("arg1", type=str)
parser.add_argument("arg2", type=str, default="")
parser.add_argument("arg3", type=str, default="")

args = vars(parser.parse_args(sys.argv[1:]))
name = args["name"]

if os.path.exists(name):
    if args["force"]:
        print(f"Removing {name}/")
        shutil.rmtree(name)
    else:
        print(f"{name}/ already exists -- use the '-F' flag to remove!")
        print("Aborting.")
        exit()

os.mkdir(name)
shutil.copyfile("presto.config", f"{name}/presto.config")
shutil.copyfile(args["python"], f"{name}/{args['python']}")
os.chdir(name)

text = "#!/bin/bash\n"
text += "#SBATCH -N 1\n"
text += f"#SBATCH -n {args['cores']}\n"
text += f"#SBATCH -p {args['partition']}\n"
text += f"#SBATCH --mem={args['cores']*args['mem'] + 2000}\n"
text += f"#SBATCH -t {args['time']}\n"
if args["exclusive"]:
    text += "#SBATCH --exclusive=mcs\n"
text += f"#SBATCH -J presto_{name}\n\n"
text += f"python {args['python']} {args['name']} {args['arg1']} {args['arg2']} {args['arg3']}"

with open("control.sh", "w+") as file:
    file.write(text)
print(f"control.sh created")

# annoyingly, you have to reload conda for w/e reason
subprocess.call(['/bin/bash', '-i', '-c', f"source deactivate; source activate openmm; sbatch control.sh "])

