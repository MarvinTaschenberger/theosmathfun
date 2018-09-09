

  ui = dashboardPagePlus(
    header = dashboardHeaderPlus(
      title = "Theo's Mathe-Spaß",
      enable_rightsidebar = TRUE,
      rightSidebarIcon = "gears"
    ),
    sidebar = dashboardSidebar(  width = 230,
                                 sidebarMenu(
                                   id = "tabs"
                                   
                                   
                                   , menuItem( "Übung"
                                               , tabName = "excercise_tab"
                                               , icon = icon("caret-right"))
                                   
                                   
                                 )),
    body = dashboardBody(
      shinyjs::useShinyjs(),
      tabItems(
        #shinyjs::useShinyjs(),
        
        tabItem("excercise_tab",
                div(class="center",
                box(title = " Übungsaufgabe", 
                    uiOutput("ex_question"), 
                    div(actionButton("solve","Lösen" ), class="flush-right aligne-right right"),
                    bsAlert("answered")
                    
                )
                )
        ),
        tabItem("test_tab"
                
        )
          )),
    rightsidebar = rightSidebar(
      background = "dark",
      rightSidebarTabContent(
        id = 1,
        title = "Wie schwer sollen die Aufgaben sein?",
        icon = "desktop",
        active = TRUE,
        sliderInput(
          "dificulty",
          "Schwierigkeit:",
          min = 0, max = 5000, value = 100
        )
      )
    ),
    title = "Right Sidebar"
              )