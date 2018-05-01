
library(plumber)

#* @apiTitle Auto Inventory Manager
#* @apiDescription Manage the inventory of an automobile store using an API.
#* @apiTag cars Functionality having to do with the management of car inventory.

#* Echo back the input
#* @param msg The message to echo
#' @get /echo
function(msg="", res){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Echo back the input via a POST
#* @param msg The message to echo
#' @post /zoom
function(msg=""){
  list(msg = paste0("The post message is: '", msg, "'"))
}

#' #' Show static files
#' #' @assets ./static
#' list()
