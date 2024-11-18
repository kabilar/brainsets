from snakemake.utils import min_version
min_version("6.0")

def expand_path(path):
    # Expands environment variables like $VAR
    path = os.path.expandvars(path)

    # Expands the '~' symbol to the user's home directory
    path = os.path.expanduser(path)

    return path

# get various paths from config file
config["RAW_DIR"] = expand_path(f"{config['raw_dir']}")
config["PROCESSED_DIR"] = expand_path(f"{config['processed_dir']}")

# include all snakefiles for all individual datasets
# includes are relative to the directory of the Snakefile in which they occur
module perich_miller_population_2018_module:
    snakefile: "pipelines/perich_miller_population_2018/Snakefile"
    config: config
use rule * from perich_miller_population_2018_module as perich_miller_population_2018_*
use rule all from perich_miller_population_2018_module as perich_miller_population_2018

module pei_pandarinath_nlb_2021_module:
    snakefile: "pipelines/pei_pandarinath_nlb_2021/Snakefile"
    config: config
use rule * from pei_pandarinath_nlb_2021_module as pei_pandarinath_nlb_2021_*
use rule all from pei_pandarinath_nlb_2021_module as pei_pandarinath_nlb_2021
