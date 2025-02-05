#-------------------------------------------------------------------------------
# Provide your Google Earth Engine email
gee_email = "thuytienbui22@gmail.com"
try(ee_Initialize(email = gee_email))

# Set the number of cores to use in parallel computing
num_cores = Sys.getenv("SLURM_CPUS_PER_TASK")
if (nchar(num_cores) > 0) {
  num_cores = as.integer(num_cores) - 1
} else {
  num_cores = 1 # default sequential
}

# Provide your US Census API Key
key <- "9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee"
census_api_key(key)

#-------------------------------------------------------------------------------
# Set to location of Dropbox and GitHub folders
path_dropbox = "INSERT PATH TO DROPBOX FOLDER HERE"
path_github = "INSERT PATH TO GITHUB REPO HERE"

# File paths based on root folders above
path_data = file.path(path_dropbox, "data")
path_output = file.path(path_dropbox, "output")
path_final = file.path(path_dropbox, "final")
path_tables = file.path(path_github, "tables", "raw")
path_figures = file.path(path_github, "figures", "raw")
path_setup = file.path(path_github, "scripts", "setup")
path_main = file.path(path_github, "scripts", "main")
path_supplementary = file.path(path_github, "scripts", "supplementary")

#-------------------------------------------------------------------------------
nonContig_stateFIPS <- c("02","60","66","15","72","78","69")
conus_stusps = setdiff(states()$STUSPS, c("AK", "AS", "GU", "HI", "MP", "PR", "VI"))
