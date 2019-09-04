# run.R
if(Sys.info()[["nodename"]] == "solu") system("cp neurosearch.Rmd /usr/local/apps/shiny-server/neurosearch")
if(Sys.info()[["nodename"]] == "zero") system("cp neurosearch.Rmd ~/ShinyApps/neurosearch")
