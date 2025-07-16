#' @export
ds.mean <- function(vector, threshold, datasources = NULL){
  if(is.null(datasources)){
    datasources <- DSI::datashield.connections_find()
  }
  DSI::datashield.aggregate(
    conns = datasources,
    expr = paste0("meanDS(", vector, ", ", threshold,")")
  )
}

