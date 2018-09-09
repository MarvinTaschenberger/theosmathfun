

shinyServer = function(input, output, session) { 
  # Catch Logging and allow proceding of the tool
  observeEvent(input$login, {
    login = check_credentials(input$user, input$password)
    if (  login) { # if loggin succesful
      enable(selector = '.sidebar-toggle')
      removeClass(selector = "body", class = "sidebar-collapse")
      addClass(id = 'lgs', class = 'hidden')
      removeClass(id = 'ldp', class = 'hidden')
    } else { # If logging failed
      alert('Sorry but the login failed. Either make sure that your credentials are correct or contact an admin to give you access to the Tool')
    }
  })
  rv <- reactiveValues(ziffer = floor(runif(1, min=0, max=10)), 
                       number = floor(runif(1, min=0, max=100))
  )
  observeEvent(input$dificulty, {
    rv$number= number = floor(runif(1, min=0, max=input$dificulty))
  })
  observeEvent(input$solve, {
    c = check_result(rv$ziffer, rv$number)
    
    closeAlert(session, "correct")
    if (as.numeric(input$answer)  == c){
      createAlert(session, "answered", "correct", title = "Richtig",
                  content = paste("Super! Die Ziffer",rv$ziffer,"kommt",c,"-Mal in der Zahl",rv$number,"vor."), append = FALSE)
    }
    else {
      createAlert(session, "answered", "correct", title = "Schade!",
                  content = paste("Leider Falsch! Die ",rv$ziffer,"kommt",c,"-Mal in der Zahl",rv$number,"vor."), append = FALSE)
    }
    rv$ziffer = floor(runif(1, min=0, max=10)) 
    rv$number= number = floor(runif(1, min=0, max=input$dificulty))
    
  })
  
  output$ex_question <- renderUI({
    div(
      div(paste("Wie oft steckt die Ziffer", rv$ziffer,"in der Zahl",rv$number, '?')),
      textInput("answer", label = '')) 
  })}

