
#shinyserver start point----
 shinyServer(function(input, output,session) {
   

    #00-基础框设置-------------
    #读取用户列表
    user_base <- getUsers(app_id = app_id)
    
    
    
    credentials <- callModule(shinyauthr::login, "login", 
                              data = user_base,
                              user_col = Fuser,
                              pwd_col = Fpassword,
                              hashed = TRUE,
                              algo = "md5",
                              log_out = reactive(logout_init()))
    
    
    
    logout_init <- callModule(shinyauthr::logout, "logout", reactive(credentials()$user_auth))
    
    observe({
       if(credentials()$user_auth) {
          shinyjs::removeClass(selector = "body", class = "sidebar-collapse")
       } else {
          shinyjs::addClass(selector = "body", class = "sidebar-collapse")
       }
    })
    
    user_info <- reactive({credentials()$info})
    
    #显示用户信息
    output$show_user <- renderUI({
       req(credentials()$user_auth)
       
       dropdownButton(
          fluidRow(  box(
             title = NULL, status = "primary", width = 12,solidHeader = FALSE,
             collapsible = FALSE,collapsed = FALSE,background = 'black',
             #2.01.01工具栏选项--------
             
             
             actionLink('cu_updatePwd',label ='修改密码',icon = icon('gear') ),
             br(),
             br(),
             actionLink('cu_UserInfo',label = '用户信息',icon = icon('address-card')),
             br(),
             br(),
             actionLink(inputId = "closeCuMenu",
                        label = "关闭菜单",icon =icon('window-close' ))
             
             
          )) 
          ,
          circle = FALSE, status = "primary", icon = icon("user"), width = "100px",
          tooltip = FALSE,label = user_info()$Fuser,right = TRUE,inputId = 'UserDropDownMenu'
       )
       #
       
       
    })
    
    observeEvent(input$closeCuMenu,{
       toggleDropdownButton(inputId = "UserDropDownMenu")
    }
    )
    
    #修改密码
    observeEvent(input$cu_updatePwd,{
       req(credentials()$user_auth)
       
       showModal(modalDialog(title = paste0("修改",user_info()$Fuser,"登录密码"),
                             
                             mdl_password('cu_originalPwd',label = '输入原密码'),
                             mdl_password('cu_setNewPwd',label = '输入新密码'),
                             mdl_password('cu_RepNewPwd',label = '重复新密码'),
                             
                             footer = column(shiny::modalButton('取消'),
                                             shiny::actionButton('cu_savePassword', '保存'),
                                             width=12),
                             size = 'm'
       ))
    })
    
    #处理密码修改
    
    var_originalPwd <-var_password('cu_originalPwd')
    var_setNewPwd <- var_password('cu_setNewPwd')
    var_RepNewPwd <- var_password('cu_RepNewPwd')
    
    observeEvent(input$cu_savePassword,{
       req(credentials()$user_auth)
       #获取用户参数并进行加密处理
       var_originalPwd <- password_md5(var_originalPwd())
       var_setNewPwd <-password_md5(var_setNewPwd())
       var_RepNewPwd <- password_md5(var_RepNewPwd())
       check_originalPwd <- password_checkOriginal(fappId = app_id,fuser =user_info()$Fuser,fpassword = var_originalPwd)
       check_newPwd <- password_equal(var_setNewPwd,var_RepNewPwd)
       if(check_originalPwd){
          #原始密码正确
          #进一步处理
          if(check_newPwd){
             password_setNew(fappId = app_id,fuser =user_info()$Fuser,fpassword = var_setNewPwd)
             pop_notice('新密码设置成功:)') 
             shiny::removeModal()
             
          }else{
             pop_notice('两次输入的密码不一致，请重试:(') 
          }
          
          
       }else{
          pop_notice('原始密码不对，请重试:(')
       }
       
       
       
       
       
    }
    )
    
    
    
    #查看用户信息
    
    #修改密码
    observeEvent(input$cu_UserInfo,{
       req(credentials()$user_auth)
       
       user_detail <-function(fkey){
          res <-tsui::userQueryField(app_id = app_id,user =user_info()$Fuser,key = fkey)
          return(res)
       } 
       
       
       showModal(modalDialog(title = paste0("查看",user_info()$Fuser,"用户信息"),
                             #完善信息用户信息布局
                             fluidRow(column(6,textInput('cu_info_name',label = '姓名:',value =user_info()$Fname )),
                                      column(6,textInput('cu_info_role',label = '角色:',value =user_info()$Fpermissions )))
                             ,
                             fluidRow(column(6, textInput('cu_info_email',label = '邮箱:',value =user_detail('Femail') )),
                                      column(6,textInput('cu_info_phone',label = '手机:',value =user_detail('Fphone') )))
                            ,
                             fluidPage(column(6,textInput('cu_info_company',label = '公司:',value =user_detail('Fcompany') )),
                                       column(6, textInput('cu_info_dept',label = '部门:',value =user_detail('Fdepartment') )))
                            ,
                            fluidPage(column(6,textInput('cu_info_businessGroup',label = '业务组:',value =user_detail('FBusinessGroup') )),
                                      column(6, textInput('cu_info_businessMan',label = '业务员:',value =user_detail('FBusinessMan') )))
                            ,
                            fluidPage(column(6,textInput('cu_info_companyScope',label = '公司范围:',value =user_detail('FCompanyScope') )),
                                      column(6, textInput('cu_info_dataScope',label = '数据范围:',value =user_detail('FDataScope') )))
                            ,
                            
                          
                             
                             
                             footer = column(shiny::modalButton('确认(不保存修改)'),
                                             
                                             width=12),
                             size = 'm'
       ))
    })
    
    
    
    #针对用户信息进行处理
    
    sidebarMenu <- reactive({
       
       #res <- setSideBarMenu(conn_be,app_id,user_info()$Fpermissions)
      tstk::debug_print('menu test start ')
       res <- tsui::menu_getItemData(app_id =app_id,permission = user_info()$Fpermissions )
       tstk::debug_print('menu test end ')
       return(res)
    })
    
    
    #针对侧边栏进行控制
    output$show_sidebarMenu <- renderUI({
       if(credentials()$user_auth){
         tstk::debug_print('menu call start ')
         res = sidebarMenu()
         tstk::debug_print('menu call end ')
          return(res)
       } else{
          return(NULL) 
       }
       
       
    })
    
    #针对工作区进行控制---------
    output$show_workAreaSetting <- renderUI({
       if(credentials()$user_auth){
         tstk::debug_print('menu call start 2')
         res = workAreaSetting
         tstk::debug_print('menu call end 2')
         
       
          return(res)
         
       } else{
          return(NULL) 
       }
       
       
    })
    
   
    
    #针对功能进行处理
    observeEvent(input$prdGen_more_button,{
      
      shinyjs::disable(id = 'prdGen_more_button')
      
      role_name = user_info()$Fpermissions
      
      mdlMultipleMaterialServer::tabPanel_initial_Server(input,output,session,conn_cfg,app_id,role_name )
      
      
    })
    
    #加载所有模块业务应收逾期报表
    var_date_overDue = tsui::var_date('saleOverdueRpt_queryDate_date')
    shiny::observeEvent(input$saleOverdueRpt_upload_btn,{
      print('bug1')
      req(credentials()$user_auth)
      print('bug2')

      user_detail <-function(fkey){
        res <-tsui::userQueryField(app_id = app_id,user =user_info()$Fuser,key = fkey)
        return(res)
      }
      print('bug3')
      Fdepartment = user_detail('Fdepartment')
      FBusinessGroup = user_detail('FBusinessGroup')
      FBusinessMan = user_detail('FBusinessMan')
      FCompanyScope = user_detail('FCompanyScope')
      FDataScope = user_detail('FDataScope')
      FDate = as.character(var_date_overDue())
      print(Fdepartment)
      print(FBusinessGroup)
      print(FBusinessMan)
      print(FCompanyScope)
      print(FDataScope)
      print('bug4')
      data  = mdlSaleOverdueRptServer::overDueRpt_Query(FDate = FDate,
                                                        Fdepartment = Fdepartment,
                                                        FBusinessGroup = FBusinessGroup,
                                                        FBusinessMan = FBusinessMan,
                                                        FCompanyScope = FCompanyScope,
                                                        FDataScope = FDataScope)
      print('bug5')
      print(data)
      tsui::run_dataTable2(id = 'saleOverdueRpt_query_dataview',data = data)
      file_name = paste0("业务应收逾期报表_",FDate,".xlsx")
      tsui::run_download_xlsx(id = 'saleOverdueRpt_upload_btn',data = data,filename = file_name)
    })
  
    
    ncount_module  =nrow(module_data)
    lapply(1:ncount_module, function(i){
      load_server0(input,output,session,module_id = module_id[i],app_id = app_id)
    })
    
    
  
  
})
