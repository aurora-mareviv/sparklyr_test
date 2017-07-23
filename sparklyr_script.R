.libPaths(c(file.path(Sys.getenv('SPARK_HOME'), 'R', 'lib'), .libPaths()))

x <- c("sparklyr", "dplyr")
lapply(x, require, character.only = TRUE)

# overwrites the previous sc to give access to sparklyr methods
sc <- spark_connect(master = "yarn-client", spark_home = "/usr/hdp/2.4.2.0-258/spark")

# load database
jscars <- spark_read_json(sc, name = "jscars", path = "amazon/jscars.json")

# database operations
head(jscars)

