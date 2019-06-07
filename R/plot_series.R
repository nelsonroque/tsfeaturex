#' `tsfeaturex: A Time-Series Feature Extraction Package

#' @name plot_series
#' @param df class: data.frame
#' @param ids class: vector of user ids to match
#' @param id_var class: string; description: column name with value 'y' in data
#' @param x class: string; description: column name with value 'x' in data
#' @param y class: string; description: column name with value 'y' in data
#' @examples
#' plot_series(isahib.sim, ids=c(1:3), id_var="id", x="day", y="y")
#' @export 

plot_series <- function(df, ids = c(1:2), id_var = "id", x = "day", y = "y") {
  eX <- enquo(x)
  eY <- enquo(y)
  
  filter.df <- df %>% filter(UQ(sym(id_var)) %in% ids)
  
  p <- ggplot(filter.df, aes(day, y, 
                             color=factor(UQ(sym(id_var))),
                             group=UQ(sym(id_var)))) + 
    geom_path() + 
    xlab(toupper(x)) +
    ylab(toupper(y)) + 
    theme_minimal() +
    theme(axis.title = element_text(size=22, vjust=0.5),
          axis.text = element_text(size=16))
  print(p)
  return(filter.df)
}