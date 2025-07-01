pop_sizes <- read.table("../inputs/pop_sizes.txt",
                        header = FALSE, 
                        col.names=c("Population", "N", "N2"))

pops <- pop_sizes$Population

for (pop in pops){
  fname <- paste0('..//hyperparam_results/', pop, '_hyperparam_results.txt') 
  hyperparams <- read.table(fname, header = TRUE)
  
  opt_params <- data.frame(matrix(ncol = 3, nrow = 0))
  colnames(opt_params) <- c("Block_Penalty", "Window_Size", "Parameter")
  
  for (parameter in c("Pearson_Corr_1bp", "Pearson_Corr_10kb", "Pearson_Corr_100kb", "L2")){
    if (parameter == "L2"){
      param_maximized <-cbind(hyperparams[order(hyperparams[, parameter], decreasing=FALSE)[1], c("Block_Penalty", "Window_Size")], Parameter = parameter)
    } else {
      param_maximized <-cbind(hyperparams[order(hyperparams[, parameter], decreasing=TRUE)[1], c("Block_Penalty", "Window_Size")], Parameter = parameter)
    }
    if (nrow(plyr::match_df(opt_params[, c("Block_Penalty", "Window_Size")], param_maximized[, c("Block_Penalty", "Window_Size")])) > 0) {
      opt_params[opt_params$Block_Penalty == param_maximized[1, "Block_Penalty"] & opt_params$Window_Size == param_maximized[1, "Window_Size"], "Parameter"] <- paste(opt_params[opt_params$Block_Penalty == param_maximized[1, "Block_Penalty"] & opt_params$Window_Size == param_maximized[1, "Window_Size"], "Parameter"], parameter, sep = ",")
    } else{
      opt_params <- rbind(opt_params, param_maximized)
    }
  }
  
  out_name <- paste0('../optimize_parameters/', pop, '_optimize_params.txt')
  write.table(opt_params,
              out_name,
              quote = FALSE,
              row.names = FALSE, 
              col.names = FALSE)
}
