library(jsonlite)
library(dplyr)

# READ, html endcoding: https://cran.r-project.org/web/packages/urltools/vignettes/urltools.html
# Ex. http://195.148.31.154:8001/articles?mesh=Neurons&affiliation=University%20of%20Eastern%20Finland

term_mesh <- "Neurons"
term_affiliation <- "University of Eastern Finland"
url <- "http://195.148.31.154:8001/"

# Create API request ----

# Search articles by affiliation
api_request <- URLencode(paste0(url, "articles?","affiliation=", term_affiliation,"&per_page=100"))

# Search articles by mesh and affiliation
api_request <- URLencode(paste0(url, "articles?mesh=", term_mesh,"&affiliation=", term_affiliation,"&per_page=100"))

# Search authors by mesh term and affiliation
api_request <- URLencode(paste0(url, "authors?","mesh=", term_mesh, "&affiliation=", term_affiliation,"&per_page=100"))

# Search authors by mesh term
api_request <- URLencode(paste0(url, "authors?","affiliation=", term_affiliation,"&per_page=100"))


jsondata <- fromJSON(api_request)


# Get all mesh terms
api_request <- URLencode(paste0("http://195.148.31.154:8001/", "all_mesh_terms"))
jsondata <- fromJSON(api_request)



## Check how the json data looks like ----
names(jsondata)
head(jsondata$abstract)
head(jsondata$pub_year)



## data extractions
jsondata$title
jsondata$abstract
jsondata$pub_year
nimet <- paste0(jsondata$authors[[1]][3])
paste0(jsondata$authors[[1]][2])

## authors list in articles
d <- jsondata$authors[[22]]
paste0(jsondata$authors[[22]]$f_name, " ", jsondata$authors[[22]]$l_name, " (",jsondata$authors[[22]]$affiliation,")", sep = "")


## authors list extraction
paste0(jsondata$l_name, ", ", jsondata$f_name)
paste0(jsondata$mesh[[1]], collapse = ", " )

## affiliation data ei ole kovin siistia
jsondata$affiliations[[1]]
paste0(jsondata$affiliations[[1]], collapse = ", " )

# Example: data to JSON
# toJSON(jsdon, pretty = TRUE)
# library(curl)
# library(RCurl)
# RCurl::httpGET(url, "{all_mesh_terms: Alzheimer Disease}")
