import configparser
import os
import re
import pathlib

# this module loads the configuration file
CONFIGURATION_FILE = "presto.config"
assert os.path.isfile(CONFIGURATION_FILE), f"Fatal error: presto configuration file '{CONFIGURATION_FILE}' not found!"
config = configparser.ConfigParser()
config.read(CONFIGURATION_FILE)

# auto-populate some directory names
PRESTO_STARTUP_DIRECTORY = os.getcwd()
USER_HOME_DIRECTORY = str(pathlib.Path.home())
def resolve_directory(directory):
    directory = re.sub("@presto", PRESTO_STARTUP_DIRECTORY, directory)
    directory = re.sub("~", USER_HOME_DIRECTORY, directory)
    return directory

# checks if a directory exists
def check_directory(field_name, directory):
    directory_exists = os.path.isdir(directory)
    if not directory_exists:
        print(f"Error in configuration entry for {field_name}: directory {directory} does not exist.")
        exit()

# check configuration parameters
GAUSSIAN_SCRIPT_DIRECTORY = resolve_directory(config['gaussian']['GAUSSIAN_SCRIPT_DIRECTORY'])
check_directory("GAUSSIAN_SCRIPT_DIRECTORY", GAUSSIAN_SCRIPT_DIRECTORY)

XTB_SCRIPT_DIRECTORY = resolve_directory(config['xtb']['XTB_SCRIPT_DIRECTORY'])
check_directory("XTB_SCRIPT_DIRECTORY", XTB_SCRIPT_DIRECTORY)

XTB_PATH = config['xtb']['XTB_PATH']
if XTB_PATH.lower() == "@auto":
    CONDA_PATH = os.getenv('CONDA_PREFIX')
    assert CONDA_PATH is not None, "Could not get a value for CONDA_PATH when trying to autodetect XTBPATH.  Aborting."
    XTB_PATH = f"{CONDA_PATH}/share/xtb"
else:
    XTB_PATH = resolve_directory(config['xtb']['XTB_PATH'])
check_directory("XTB_PATH",XTB_PATH)

# finished
print(f"Loaded configuration data from {CONFIGURATION_FILE}.")

