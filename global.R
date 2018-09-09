library("shiny")
library("shinydashboard")
library("shinydashboardPlus")
library("shinyjs")
library("shinyBS")
library("stringr")




check_credentials = function(user, password){
  if (user =="Theodor" & password =="mathe2018"){
    return(TRUE)
  }else{
    return(FALSE)
  }
}


check_result = function(digit, number){
  c = 0 
  for (i in 1:number){
    
    
    c =  c+ str_count(as.character(i),as.character(digit))
    
    
  }
  return(c)
}