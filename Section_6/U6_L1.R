#### Spark and R ###

# Download and install sparkinstall package from github
# code refrence :: https://github.com/rstudio/spark-install

library(devtools)
install_github(repo = "rstudio/spark-install", subdir = "R")

# load the package
library(sparkinstall)

# list the versions available to install
spark_available_versions()

# Install specific version of spark
spark_install(version = "2.4.3")

# varify the installtion
spark_installed_versions()

# install sparklyr package
install.packages("sparklyr", dependencies = T)

# load the sparklyr package
library(sparklyr)

# invoke the configuration settings
config <- spark_config()

# setting cores
config$'sparklyr.cores.local' = 6

# setting the system memory (RAM)
config$'sparklyr.shell.driver-memory' = "16G"

# allocation of fraction of RAM
config$'sparklyr.memory.fraction' = 0.9

# Connecting spark
sc <- spark_connect(master = "local", version = "2.4.3", config = config)

# to unset the java conflict, if in case any error is thrown
Sys.unsetenv("JAVA_HOME") 








