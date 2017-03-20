#' Trial Visits Domain
#' 
#' @name Trial Visits Domain
#' @description Information on the planned visits of an ImmPort study is reformated to the CDISC SDTM Trial Visits (TV) 
#' domain model, and is a list of 2 data frames containing 1) Trial Visits data \code{\link{TV}} 
#' and 2) any supplemental Trial Visits data \code{\link{SUPP}}
NULL
#> NULL 

# Get Trial Visits data of a specific study
# 
# The function \code{getTrialVisits} queries the ImmPort database for Trial Visits data and 
# reformats it to the CDISC SDTM Trial Visits (TV) domain model 
# 
# @param data_src A connection handle to ImmPort (MySQL or SQLite) database instance or 
# a directory handle to folder where study RDS files are located
# @param study_id Identifier of a specific study
# @return a list of 2 data frames containing 1) Trial Visits data \code{\link{TV}} and 2) any supplemental 
#   Trial Visits data \code{\link{SUPP}}
# @examples
# \dontrun{
#   getTrialVisits(data_src, "SDY1")
# }
getTrialVisits <- function(data_src, study_id) {
  cat("loading Trial Visits data....")
  
  tv_cols <- c("STUDYID", "DOMAIN", "VISITNUM", "VISIT", "ARMCD", "ARM", "TVSTRL", "TVENRL")
  
  trialVisitsSQL <- paste("SELECT distinct
                            pv.study_accession,
                            \"TV\" as domain,
                            pv.order_number,
                            pv.name,
                            ac.arm_accession,
                            ac.name,
                            pv.start_rule,
                            pv.end_rule
                            FROM planned_visit pv
                            INNER JOIN
                            planned_visit_2_arm pv2a ON pv2a.planned_visit_accession=pv.planned_visit_accession
                            INNER JOIN
                            arm_or_cohort ac ON ac.arm_accession=pv2a.arm_accession
                            WHERE pv.study_accession in ('", study_id, "')
                            ORDER BY pv.order_number", sep = "")
  
  if ((class(data_src)[1] == 'MySQLConnection') || 
      (class(data_src)[1] == 'SQLiteConnection')) {
    tv_df <- dbGetQuery(data_src, statement = trialVisitsSQL)
    colnames(tv_df) <- tv_cols
    supptv_df <- data.frame()
    if (nrow(tv_df) > 0) {
    }
  } else {
    l <- loadSerializedStudyData(data_src, study_id, "Trial Visits")
    tv_df <- l[[1]]
    supptv_df <- l[[2]]
  }
  
  cat("done", "\n")
  
  tv_l <- list()
  if (nrow(tv_df) > 0)
    tv_l <- list(tv_df=tv_df, supptv_df=supptv_df)
  
  tv_l
}

# Get count of Trial Visits data of a specific study
# 
# The function \code{getCountOfTrialVisits} queries the ImmPort database for count 
# of Trial Visits data 
# 
# @param conn A connection handle to ImmPort database instance
# @param study_id Identifier of a specific study
# @return a count of Trial Visits data 
# @examples
# \dontrun{
#   # get count of study SDY1's Trial Visits data
#   count <- getCountOfTrialVisits(conn, "SDY1")
# }
getCountOfTrialVisits <- function(conn, study_id) {
  sql_stmt <- paste("SELECT count(*)
                    FROM planned_visit pv
                    WHERE pv.study_accession in ('", study_id, "')", sep = "")
  
  count <- dbGetQuery(conn, statement = sql_stmt)
  
  count[1, 1]
} 

##' Trial Visits Domain Variables
##' @name TV
##' @description {
##'   \tabular{ll}{
##'     \strong{Variable Name  } \tab \strong{Variable Label} \cr
##'     STUDYID \tab Study Identifier \cr
##'     DOMAIN  \tab Domain Abbreviation \cr
##'     VISITNUM \tab Visit Number \cr
##'     VISIT \tab Visit Name \cr
##'     ARMCD \tab Planned Arm Code \cr
##'     ARM \tab Name of Planned Arm \cr
##'     TVSTRL \tab Visit Start Rule \cr
##'     TVENRL \tab Visit End Rule
##'   }
##' }
NULL
#> NULL 

