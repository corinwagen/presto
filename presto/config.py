import configparser, os, re, pathlib, yaml, cctk, h5py, logging
import numpy as np
import presto

logger = logging.getLogger(__name__)

#### OVERALL PRESTO CONFIGURATION, RUNS ON STARTUP

# this module loads the configuration file
CONFIGURATION_FILE = "presto.config"
if not os.path.isfile(CONFIGURATION_FILE):
    if "PRESTO_CONFIG" in os.environ:
        CONFIGURATION_FILE = os.environ["PRESTO_CONFIG"]
    else:
        raise ValueError(f"Fatal error: presto configuration file '{CONFIGURATION_FILE}' not found in current directory and $PRESTO_CONFIG not found")

config = configparser.ConfigParser()
config.read(CONFIGURATION_FILE)

# auto-populate some directory names
PRESTO_STARTUP_DIRECTORY = os.getcwd()
USER_HOME_DIRECTORY = str(pathlib.Path.home())
def resolve_directory(directory):
    directory = re.sub("@presto", PRESTO_STARTUP_DIRECTORY, directory)
    directory = re.sub("~", USER_HOME_DIRECTORY, directory)
    return directory

def check_directory(field_name, directory):
    """ Checks if a directory exists."""
    directory_exists = os.path.isdir(directory)
    if not directory_exists:
        logger.error(f"Error in configuration entry for {field_name}: directory {directory} does not exist.")

XTB_PATH = config['xtb']['XTB_PATH']
if XTB_PATH.lower() == "@auto":
    CONDA_PATH = os.getenv('CONDA_PREFIX')
    assert CONDA_PATH is not None, "Could not get a value for CONDA_PATH when trying to autodetect XTBPATH. Aborting. (Do you have the environment activated?)"
    XTB_PATH = f"{CONDA_PATH}/share/xtb"
else:
    XTB_PATH = resolve_directory(config['xtb']['XTB_PATH'])
check_directory("XTB_PATH",XTB_PATH)

# load execs - will be run during Calculator.__init__()
XTB_EXEC = config['xtb']['XTB_EXEC']
G16_EXEC = config['gaussian']['GAUSSIAN_EXEC']
logger.info(f"Loaded configuration data from {CONFIGURATION_FILE}.")

def build(*args, **kwargs):
    return presto.build(*args, **kwargs)
