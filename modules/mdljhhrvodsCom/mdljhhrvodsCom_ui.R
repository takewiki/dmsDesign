#tabName need to be update
#tabBox title need to be update
#tabBox id need to be update
tabItem(tabName = "mdljhhrvodsCom",
                    fluidRow(
                      column(width = 12,
                             tabBox(title ="嘉好人资凭证ods数据库查询",width = 12,
                                    id='tabSet_mdljhhrvodsCom',height = '300px',
                                    #以上为注册ui组件的内容-----
                                    #begin----
                                    #uiComponent seperated by comma (,)
                                     # mdlDemoUI::buttonUI(),
                                     # mdlDemoUI::textUI(),
                                     # mdlDemoUI::dateUI(),
                                    mdljhhrvodsUI::jhhrvsalaryUI(),
                                    mdljhhrvodsUI::jhhrvsocialsecurityUI(),
                                    mdljhhrvodsUI::jhhrvdetailUI(),
                                    mdljhhrvodsUI::jhhrvrddetailUI(),
                                    mdljhhrvodsUI::jhhrvnonrddetailUI(),
                                    mdljhhrvodsUI::jhhrvrulevoucherUI(),
                                    mdljhhrvodsUI::jhhrvtplvoucherUI(),
                                    # mdljhhrvodsUI::jhhrvtploutputvoucherUI(),
                                    mdljhhrvodsUI::jhhrvfnoteUI(),
                                    mdljhhrvodsUI::jhhrvacctUI(),
                                    mdljhhrvodsUI::jhhrvdeptUI(),
                                    mdljhhrvodsUI::jhhrvacctreclassUI(),
                                    mdljhhrvodsUI::jhhrvworkcenterUI(),
                                    mdljhhrvodsUI::jhhrvrditemUI(),
                                    # mdljhhrvodsUI::jhhrvcosucompanyUI(),
                                    mdljhhrvodsUI::jhhrvmiddleTableUI(),
                                    mdljhhrvodsUI::jhhrvdeptcomparisonUI(),
                                    mdljhhrvodsUI::jhhrvcategoryTypeTableUI(),
                                    mdljhhrvodsUI::jhhrvpreCheckUI(),
                                    mdljhhrvodsUI::jhhrvdefaultValueUI()
                                    
                                    #end----
                                    
                                    
                                    
                                    
                                    
                             )
                      )
                    )
)
 