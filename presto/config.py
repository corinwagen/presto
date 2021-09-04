import configparser, os, re, pathlib, yaml, cctk, h5py, logging
import numpy as np
import presto

logger = logging.getLogger(__name__)

"""
*presto* configuration, runs on startup.
"""

def resolve_directory(directory):
    """ Substitues @presto and ~ """
    directory = re.sub("@presto", PRESTO_STARTUP_DIRECTORY, directory)
    directory = re.sub("~", USER_HOME_DIRECTORY, directory)
    return directory

def check_directory(field_name, directory):
    """ Checks if a directory exists."""
    directory_exists = os.path.isdir(directory)
    if not directory_exists:
        logger.error(f"Error in configuration entry for {field_name}: directory {directory} does not exist.")

# this loads the configuration file
CONFIGURATION_FILE = None
if os.path.isfile("presto.config"):
        CONFIGURATION_FILE = "presto.config"
    if "PRESTO_CONFIG" in os.environ:
        CONFIGURATION_FILE = os.environ["PRESTO_CONFIG"]
    else:
        logger.info(f"presto configuration file presto.config not found in current directory and $PRESTO_CONFIG not found")

config = configparser.ConfigParser()
if CONFIGURATION_FILE:
    logger.info(f"reading presto configuration file {CONFIGURATION FILE}")
    config.read(CONFIGURATION_FILE)

# auto-populate some directory names
PRESTO_STARTUP_DIRECTORY = os.getcwd()
USER_HOME_DIRECTORY = str(pathlib.Path.home())

# find xtb path
XTB_PATH = None
if config.has_option("xtb", "XTB_PATH"):
    XTB_PATH = config['xtb']['XTB_PATH']

if (XTB_PATH is None) or (XTB_PATH.lower() == "@auto"):
    CONDA_PATH = os.getenv('CONDA_PREFIX')
    assert CONDA_PATH is not None, "Could not get a value for CONDA_PATH when trying to autodetect XTBPATH. Aborting. (Do you have the environment activated?)"
    XTB_PATH = f"{CONDA_PATH}/share/xtb"
else:
    XTB_PATH = resolve_directory(config['xtb']['XTB_PATH'])
check_directory("XTB_PATH",XTB_PATH)

# load external execs 
XTB_EXEC = "xtb"
if config.has_option("xtb", "XTB_EXEC"):
    XTB_EXEC = config['xtb']['XTB_EXEC']

G16_EXEC = "g16"
if config.has_option("gaussian", "GAUSSIAN_EXEC"):
    G16_EXEC = config['gaussian']['GAUSSIAN_EXEC']

PACKMOL_EXEC = "packmol"
if config.has_option("packmol", "PACKMOL_EXEC"):
    PACKMOL_EXEC = config['packmol']['PACKMOL_EXEC']

# backwards-compatibility with v0.2.4 and before
def build(*args, **kwargs):
    return presto.build(*args, **kwargs)
