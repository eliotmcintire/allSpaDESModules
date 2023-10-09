getOrUpdatePkg <- function(p, minVer, repo) {
  if (!isFALSE(try(packageVersion(p) < minVer, silent = TRUE) )) {
    if (missing(repo)) repo = c("predictiveecology.r-universe.dev", getOption("repos"))
    install.packages(p, repos = repo)
  }
}
getOrUpdatePkg("Require", "0.3.1.14")
getOrUpdatePkg("SpaDES.project", "0.0.8.9013")
getOrUpdatePkg("SpaDES.core", "2.0.2.9006")
getOrUpdatePkg("reproducible", "2.0.8.9006")
library(SpaDES.project)

mods <- listModules("fireSense", "PredictiveEcology")
pkgload::load_all("c:/Eliot/GitHub/SpaDES.project")
out <- setupProject(modules = mods, 
                    options = list(Require.cloneFrom = Sys.getenv("R_LIBS_USER")),
                    useGit = "sub") # get fireSense modules & sets paths
getModule("bcgov/castor", modulePath = out$paths$modulePath)
