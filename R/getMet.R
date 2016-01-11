#######################################################################################################
#               Written by Andrew R Sommerlot <andrewrs@vt.edu>, March 2015                           #
#######################################################################################################

###############################################################################################
# 					           *** Version 0.1.1 *** 										  #
#				download and format meteorological data for use in                            #
#						hydrologic modeling													  #
# 				central function of the hydroMet packages                                     #
# Currently supports 																		  #
#		sources: CFSR                                                                         #
#		formats: SWAT                                                                         #              
###############################################################################################

#' Gets met data from a specified source and creates model input files in the specified format
#' @param locations - data.frame object or location of csv file with two columns, the first being lattitude and second being longidute in decimal degrees. These locations will be the locations of the collected met data.
#' @param dataSource - Source of met data from predefined source list. Currenly only 'cfsr' is supported.
#' @param outFormat - Format of met data output from predefined source. Currently only 'swat' is supported.
#' @param outDir - Directory where ouput files will be saved
#' @return returns specified  met data in specified format
#' @examples 
#' \dontrun{
#' locations = data.frame(lat = 38, lon = 79)
#' outDir = "test"
#' getMet(locations=locations, outDir=outDir)
#' }
#' @export 


getMet <-  function(locations, dataSource = 'cfsr', outFormat = 'swat', outDir = getwd()){
  
  if(dataSource != 'cfsr'){
    stop('The getMet function does not yet have support for data sources other than the cfsr model\n', 'Set dataSource to cfsr to continue')
  } else if(outFormat != 'swat') {
    stop('The getMet function does not yet have support for output formats other than the swat model\n', 'Set outFormat to swat to continue')
  }else{
    getSWATcfsr(locations, outDir = outDir)
  }
}