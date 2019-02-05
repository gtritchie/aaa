# exercise job launcher APIs via rstudioapi

whoAmILocal <- function() {
  rstudioapi::launcherSubmitJob(command="whoami", cluster="Local", name="Who Am I Local")
}

runScriptKube <- function() {
  rstudioapi::launcherSubmitJob(
    args=c("--slave", "--no-save", "--no-restore", "--file=/root/R/aaa/sleepy.R"),
    cluster=c("Kubernetes"),
    command="R",
    container=rstudioapi::launcherContainer("rstudio:session-local-build"),
    mounts=list(rstudioapi::launcherHostMount(path = "/home/{USER}", mountPath = "/root")),
    name="Run script in minikube")
}
