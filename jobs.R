# jobs.R

imageName <- "rstudio/r-session-complete:bionic-1.3.1093-1"

whoAmILocal <- function() {
  .rs.api.launcher.submitJob(command="whoami",
                             cluster="Local",
                             name="Who Am I Local")
}

whoAmIKube <- function() {
  .rs.api.launcher.submitJob(command="whoami", 
                         cluster="Kubernetes",
                         container=.rs.api.launcher.newContainer(imageName),
                         name="Who Am I Kube")
}

listRootKube <- function() {
  .rs.api.launcher.submitJob(args=c("-l", "/"),
                             command="ls", 
                             cluster="Kubernetes",
                             container=.rs.api.launcher.newContainer(imageName),
                             name="List Root Folder Kube")
}

listHomeKube <- function() {
  .rs.api.launcher.submitJob(args=c("-l", "/home"),
                             command="ls", 
                             cluster="Kubernetes",
                             container=.rs.api.launcher.newContainer(imageName),
                             name="List Home Folder Kube")
}

sleepJobLocal <- function(delay = "10") {
  .rs.api.launcher.submitJob(args=delay, 
                             exe="/bin/sleep", 
                             cluster="Local", 
                             name=paste("Sleep Local", delay))
}

sleepJobKube <- function(delay = "10") {
  .rs.api.launcher.submitJob(args=delay, 
                             command="sleep", 
                             cluster="Kubernetes",
                             container=.rs.api.launcher.newContainer(imageName),
                             name=paste("Sleep Kube", delay))
}

loopJobLocal <- function() {
  .rs.api.launcher.submitJob(args=c("--slave", "--no-save", "--no-restore"), 
                             command="R", 
                             cluster="Local",
                             stdin="for (i in 1:120) {cat(i);cat('\n');Sys.sleep(1)}", 
                             name="Local Slowly Count to 120")
}

loopJobKube <- function() {
  .rs.api.launcher.submitJob(
      args=c("--slave", "--no-save", "--no-restore"),
      cluster="Kubernetes",
      command="R",
      container=.rs.api.launcher.newContainer(imageName),
      name="Kube Slowly Count to 120",
      stdin="for (i in 1:120) {cat(i);cat('\n');Sys.sleep(1)}")
}

envJobKube <- function() {
  .rs.api.launcher.submitJob(args=c("--slave", "--no-save", "--no-restore"), 
                             command="R", 
                             cluster=c("Kubernetes"),
                             container=.rs.api.launcher.newContainer(imageName),
                             stdin="Sys.getenv()", 
                             name="Kube Show Environment")
}

showShareKube <- function() {
  .rs.api.launcher.submitJob(args=c("-l", "/root"),
                             command="ls", 
                             cluster=c("Kubernetes"),
                             container=.rs.api.launcher.newContainer(imageName),
                             mounts=list(.rs.api.launcher.newHostMount(mountPath = "/root", path = "/home/{USER}")),
                             name="Kube Show Mount")
}

scriptJobKube <- function() {
  .rs.api.launcher.submitJob(
    args=c("--slave", "--no-save", "--no-restore"),
    cluster="Kubernetes",
    command="R",
    container=.rs.api.launcher.newContainer(imageName),
    name="Kube Slowly Count to 120",
    stdin="for (i in 1:120) {cat(i);cat('\n');Sys.sleep(1)}")
}

runScriptKube <- function() {
  .rs.api.launcher.submitJob(
    args=c("--slave", "--no-save", "--no-restore", "--file=/root/R/aaa/sleepy.R"),
    cluster=c("Kubernetes"),
    command="R",
    container=.rs.api.launcher.newContainer(imageName),
    mounts=list(.rs.api.launcher.newHostMount(path = "/home/{USER}", mountPath = "/root")),
    name="Run script in minikube",
    applyConfigSettings = FALSE)
}

runScriptKubeUsingConfig <- function() {
  .rs.api.launcher.submitJob(
    args=c("--slave", "--no-save", "--no-restore", "--file=/root/R/aaa/sleepy.R"),
    cluster=c("Kubernetes"),
    command="R",
    container=.rs.api.launcher.newContainer(imageName),
    name="Run script in minikube",
    applyConfigSettings = TRUE)
}
