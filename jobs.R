# jobs.R

sleepJobLocal <- function(delay = "10") {
  .rs.launcher.submitJob(args=delay, 
                         command="sleep", 
                         cluster="Local", 
                         name=paste("Sleep Local", delay))
}

sleepJobKube <- function(delay = "10") {
  .rs.launcher.submitJob(args=delay, 
                         command="sleep", 
                         cluster="Kubernetes", 
                         name=paste("Sleep Local", delay))
}
