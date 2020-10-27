# exercise job launcher APIs via rstudioapi, eh?

imageName <- "rstudio/r-session-complete:bionic-1.3.1093-1"

whoAmILocal <- function() {
  rstudioapi::launcherSubmitJob(command="whoami", cluster="Local", name="Who Am I Local")
}

runScriptKube <- function() {
  rstudioapi::launcherSubmitJob(
    args=c("--slave", "--no-save", "--no-restore", "--file=/root/R/aaa/sleepy.R"),
    cluster=c("Kubernetes"),
    command="R",
    container=rstudioapi::launcherContainer(imageName),
    mounts=list(rstudioapi::launcherHostMount(path = "/home/{USER}", mountPath = "/root")),
    name="Run script in minikube",
    applyConfigSettings = FALSE)
}

runScriptKubeUsingConfig <- function() {
  rstudioapi::launcherSubmitJob(
    args=c("--slave", "--no-save", "--no-restore", "--file=/root/R/aaa/sleepy.R"),
    cluster=c("Kubernetes"),
    command="R",
    container=rstudioapi::launcherContainer(imageName),
    name="Run script in minikube",
    applyConfigSettings = TRUE)
}
