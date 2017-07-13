x <- c("sparklyr", "dplyr", "knitr", "ggplot2", "repr")
lapply(x, require, character.only = TRUE)

# overwrites the previous sc to give access to sparklyr methods
sc <- spark_connect(master = "yarn-client", spark_home = "/usr/hdp/2.4.2.0-258/spark")
sqlContext = HiveContext(sc)

# load database
jscars <- spark_read_json(sc, name = "jscars", path = "amazon/jscars.json")

# database operations
head(jscars)

