# jobs.R

whoAmILocal <- function() {
  .rs.launcher.submitJob(command="whoami",
                         cluster="Local",
                         name="Who Am I Local")
}

whoAmIKube <- function() {
  .rs.launcher.submitJob(command="whoami", 
                         cluster="Kubernetes",
                         container=.rs.launcher.new_Container("rstudio:session-local-build"),
                         name="Who Am I Kube")
}

listRootKube <- function() {
  .rs.launcher.submitJob(args=c("-l", "/"),
                         command="ls", 
                         cluster="Kubernetes",
                         container=.rs.launcher.new_Container("rstudio:session-local-build"),
                         name="List Root Folder Kube")
}

listHomeKube <- function() {
  .rs.launcher.submitJob(args=c("-l", "/home"),
                         command="ls", 
                         cluster="Kubernetes",
                         container=.rs.launcher.new_Container("rstudio:session-local-build"),
                         name="List Home Folder Kube")
}

sleepJobLocal <- function(delay = "10") {
  .rs.launcher.submitJob(args=delay, 
                         exe="/bin/sleep", 
                         cluster="Local", 
                         name=paste("Sleep Local", delay))
}

sleepJobKube <- function(delay = "10") {
  .rs.launcher.submitJob(args=delay, 
                         command="sleep", 
                         cluster="Kubernetes",
                         container=.rs.launcher.new_Container("rstudio:session-local-build"),
                         name=paste("Sleep Kube", delay))
}

loopJobLocal <- function() {
  .rs.launcher.submitJob(args=c("--slave", "--no-save", "--no-restore"), 
                         command="R", 
                         cluster="Local",
                         exposedPorts = c(2345L, 6789L),
                         stdin="for (i in 1:120) {cat(i);cat('\n');Sys.sleep(1)}", 
                         name="Local Slowly Count to 120")
}

loopJobKube <- function() {
  .rs.launcher.submitJob(
      args=c("--slave", "--no-save", "--no-restore"),
      cluster="Kubernetes",
      command="R",
      container=.rs.launcher.new_Container("rstudio:session-local-build"),
      environment=c(FUNCTION="loopJobKube", FOO="bar"),
      exposedPorts = c(2345L, 6789L),
      name="Kube Slowly Count to 120",
      stdin="for (i in 1:120) {cat(i);cat('\n');Sys.sleep(1)}")
}

envJobKube <- function() {
  .rs.launcher.submitJob(args=c("--slave", "--no-save", "--no-restore"), 
                         command="R", 
                         cluster=c("Kubernetes"),
                         container=.rs.launcher.new_Container("rstudio:session-local-build"),
                         stdin="Sys.getenv()", 
                         name="Kube Show Environment")
}

showShareKube <- function() {
  .rs.launcher.submitJob(args=c("-l", "/testing"),
                         command="ls", 
                         cluster=c("Kubernetes"),
                         container=.rs.launcher.new_Container("rstudio:session-local-build"),
                         mounts=list(.rs.launcher.new_HostMount("/testing", "/testing")),
                         name="Kube Show Mount")
}

