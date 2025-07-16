# dsWorkshopClient
Example of Client package for DataSHIELD

To install the packages run:

```{r}
install.packages("devtools")
devtools::install_github("mdrra-dev/dsWorkshopServer")
devtools::install_github("mdrra-dev/dsWorkshopClient")
```

The package contain a simple function to return the mean and the length of a numeric vector.
The function takes in input a secon parametes which fix a length threshold for the vector. If the length of the vector is lower of the threshold, the function will return an error.

To test the package run the following code:

```{r}
install.packages("DSLite")
install.packages("dsBase")

library(dsWorkshopClient)
library(dsWorkshopServer)
library(DSLite)

# Definition of the numeric vector 
v <- c(1:10)

# Creation of virtualized server with DSLite, assigning everything needed on it
dslite.server <- newDSLiteServer(tables=list(exposures = v),
                                 config = DSLite::defaultDSConfiguration(include=c("dsBase", "dsWorkshopServer")))

builder <- DSI::newDSLoginBuilder()
builder$append(server = "server1", url = "dslite.server", table = "exposures", driver = "DSLiteDriver")
logindata.dslite <- builder$build()

# Login to the virtualized server
conns <- datashield.login(logindata.dslite, assign=T, symbol = "exposures")

# Test the function
dsWorkshopClient::ds.mean("exposures", threshold = 5)

```


