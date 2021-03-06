#' Findings About Domain
#' 
#' @name Findings About Domain
#' @description The Findings About data of an ImmPort study is reformated to the CDISC SDTM Findings 
#' About (FA) domain model, and is a list of 2 data frames containing 1) Findings About data \code{\link{FA}} 
#' and 2) any supplemental Findings About data \code{\link{SUPPFA}}
NULL
#> NULL 

# call to globalVariables to prevent from generating NOTE: no visible binding for global variable <variable name>
# this hack is to satisfy CRAN (http://stackoverflow.com/questions/9439256/how-can-i-handle-r-cmd-check-no-visible-binding-for-global-variable-notes-when)
globalVariables(c("FASEQ", "QNAM", "QVAL", "FATOD"))

# Get Findings About data of a specific study
# 
# The function \code{getFindingsAbout} queries the ImmPort database for Findings About data and 
# reformats it to the CDISC SDTM Findings About (FA) domain model 
# 
# @param data_src A connection handle to ImmPort (MySQL or SQLite) database instance or 
# a directory handle to folder where study RDS files are located
# @param study_id Identifier of a specific study
# @return a list of 2 data frames containing 1) Findings About data \code{\link{FA}} and 2) any supplemental 
#   Findings About data \code{\link{SUPPFA}}
# @examples
# \dontrun{
#   getFindingsAbout(data_src, "SDY1")
# }
#' @importFrom DBI dbGetQuery
#' @importFrom plyr rename
#' @importFrom data.table as.data.table is.data.table .N :=
getFindingsAbout <- function(data_src, study_id) {
    cat("loading Findings About data....")
  
    fa_cols <- c("STUDYID", "DOMAIN", "USUBJID", "FASEQ", "FATEST", "FACAT", "FAOBJ",  
                "FAORRES", "FAORRESU", "FALOC", "FATOD", "VISITNUM", "VISIT", "FADY")
  
    suppfa_cols <- c("STUDYID", "RDOMAIN", "USUBJID", "IDVAR", "IDVARVAL", "QNAM", "QLABEL", "QVAL")
  
  
    sql_stmt <- paste("SELECT distinct
                      asmp.study_accession,
                      \"FA\" as domain,
                      asmc.subject_accession,
                      cast(0 as UNSIGNED INTEGER) as seq,
                      asmc.name_reported,
                      asmp.name_reported,
                      asmc.organ_or_body_system_reported,
                      asmc.result_value_reported,
                      asmc.result_unit_reported,
                      asmc.location_of_finding_reported,
                      asmc.time_of_day,
                      pv.order_number,
                      pv.name,
                      asmc.study_day                    
                      FROM  assessment_component asmc
                      INNER JOIN
                      assessment_panel asmp ON asmc.assessment_panel_accession=asmp.assessment_panel_accession
                      INNER JOIN
                      planned_visit pv ON asmc.planned_visit_accession=pv.planned_visit_accession
                      WHERE (asmp.study_accession in ('", study_id, "')) AND 
                      (asmp.assessment_type='Other') 
                      ORDER BY asmc.subject_accession", sep = "")

    if ((class(data_src)[1] == 'MySQLConnection') || 
        (class(data_src)[1] == 'SQLiteConnection')) {
      fa_df <- dbGetQuery(data_src, statement = sql_stmt)
      colnames(fa_df) <- fa_cols
      suppfa_df <- data.frame()
      if (nrow(fa_df) > 0) {
        fa_df <- transform(fa_df, FASEQ = as.integer(FASEQ))
        fa.dt <- as.data.table(fa_df)
        if (is.data.table(fa.dt) == TRUE) fa.dt[, `:=`(FASEQ, seq_len(.N)), by = "USUBJID"]
        fa_df <- as.data.frame(fa.dt)
  
        qnam_values = c("FATOD")
        qlabel_values= c("Time of Day")
        
        suppfa_df <- reshape2::melt(fa_df, id = c("STUDYID", "DOMAIN", "USUBJID", "FASEQ"), 
                                    measure = qnam_values, 
                                    variable.name = "QNAM", 
                                    value.name = "QVAL")
        suppfa_df <- transform(suppfa_df, QLABEL = unlist(qlabel_values[QNAM]))
        suppfa_df <- plyr::rename(suppfa_df, c("DOMAIN" = "RDOMAIN", "FASEQ" = "IDVARVAL"))
        suppfa_df$IDVAR <- "FASEQ"
        
        suppfa_df <- suppfa_df[suppfa_cols]
        
        # remove rows that have empty QVAL values
        suppfa_df <- subset(suppfa_df,QVAL!="")      
  
        fa_df <- subset(fa_df, select = -c(FATOD))
      }
    } else {
      l <- loadSerializedStudyData(data_src, study_id, "Findings About")
      fa_df <- l[[1]]
      suppfa_df <- l[[2]]
    }
    
    cat("done", "\n")
    
    fa_l <- list()
    if (nrow(fa_df) > 0)
      fa_l <- list(fa_df=fa_df, suppfa_df=suppfa_df)
    
    fa_l
}

# Get count of Findings About data of a specific study
# 
# The function \code{getCountOfFindingsAbout} queries the ImmPort database for count 
# of Findings About data 
# 
# @param conn A connection handle to ImmPort database instance
# @param study_id Identifier of a specific study
# @return a count of Findings About data 
# @examples
# \dontrun{
#   # get count of study SDY1's Findings About data
#   count <- getCountOfFindingsAbout(conn, "SDY1")
# }
getCountOfFindingsAbout <- function(conn, study_id) {
    sql_stmt <- paste("SELECT count(*)
                    FROM  assessment_component asmc
                    INNER JOIN
                      assessment_panel asmp ON asmc.assessment_panel_accession=asmp.assessment_panel_accession 
                      WHERE (asmp.study_accession in ('", study_id, "')) AND 
                      asmp.assessment_type='Other'", sep = "")
    
    count <- dbGetQuery(conn, statement = sql_stmt)
    
    count[1, 1]
} 

##' Findings About Domain Variables
##' @name FA
##' @description {
##'   \tabular{ll}{
##'     \strong{Variable Name  } \tab \strong{Variable Label} \cr
##'     STUDYID \tab Study Identifier \cr
##'     DOMAIN  \tab Domain Abbreviation \cr
##'     USUBJID \tab Unique Subject Identifier \cr
##'     FASEQ \tab Sequence Number \cr
##'     FATEST \tab Findings About Test Name \cr
##'     FAOBJ \tab Object of the Observation \cr
##'     FACAT \tab Category for Findings About \cr
##'     FAORRES \tab Results or Findings in Original Units \cr
##'     FAORRESU \tab Original Units \cr
##'     FALOC \tab Location of the Finding About \cr
##'     VISITNUM \tab Visit Number \cr
##'     VISIT \tab Visit Name \cr
##'     FADY \tab Study Day of Collection
##'   }
##' }
NULL
#> NULL 

##' Findings About Domain Supplemental Variables
##' @name SUPPFA
##' @description {
##'   \tabular{ll}{
##'     \strong{Variable Name} \tab \strong{Variable Label} \cr
##'     STUDYID \tab Study Identifier \cr
##'     RDOMAIN  \tab Related Domain Abbreviation \cr
##'     USUBJID \tab Unique Subject Identifier \cr
##'     FASEQ \tab Sequence Number \cr
##'     IDVAR \tab Identifying Variable \cr
##'     IDVARVAL \tab Identifying Variable Value \cr
##'     QNAM \tab Qualifier Variable Name \cr
##'     QLABEL \tab Qualifier Variable Label \cr
##'     QVAL \tab Data Value
##'   }
##' }
##' @note The following table enumerates the values in QNAM and QLABEL variables {
##'   \tabular{ll}{
##'     \strong{QNAM} \tab \strong{QLABEL} \cr
##'     FATOD \tab Time of Day of Collection \cr
##'   }
##' }
NULL
#> NULL

