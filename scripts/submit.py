import argparse, math, sys, os, subprocess, glob, re, shutil

parser = argparse.ArgumentParser(prog="submit.py")
parser.add_argument("--partition", "-p", type=str, default="serial_requeue")
parser.add_argument("--time", "-t", type=int, default=7200)
parser.add_argument("--cores", "-c", type=int, default=16)
parser.add_argument("--mem", "-m", type=int, default=2000) # per core, in MB
parser.add_argument("--force", "-F", default=False, action="store_true")
parser.add_argument("files", type=str)

args = vars(parser.parse_args(sys.argv[1:]))

for filename in glob.iglob(args["files"], recursive=True):
    if re.search("submit", filename):
        continue

    work_dir = re.sub(r".py$", "", filename)

    if os.path.exists(work_dir):
        if args["force"]:
            print(f"removing {work_dir}")
            shutil.rmtree(work_dir)
        else:
            print(f"{work_dir} already exists -- use the '-F' flag to remove!")

    os.mkdir(work_dir)
    os.rename(filename, f"{work_dir}/{filename}")

    try:
        os.rename(f"{work_dir}.xyz", f"{work_dir}/{work_dir}.xyz")
    except:
        print("didn't find input file!")

    os.chdir(work_dir)
    print(f"{work_dir} created")

    text = "#!/bin/bash\n"
    text += "#SBATCH -N 1\n"
    text += f"#SBATCH -n {args['cores']}\n"
    text += f"#SBATCH -p {args['partition']}\n"
    text += f"#SBATCH --mem={args['cores']*args['mem'] + 2000}\n"
    text += f"#SBATCH -t {args['time']}\n"
    text += f"#SBATCH -J presto_{work_dir}\n\n"
    text += f"python {filename}"

    with open("control.sh", "w+") as file:
        file.write(text)
    print(f"{work_dir}/control.sh created")

    subprocess.call(['/bin/bash', '-i', '-c', "sbatch control.sh"])

