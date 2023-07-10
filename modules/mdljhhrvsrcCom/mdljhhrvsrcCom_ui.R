#tabName need to be update
#tabBox title need to be update
#tabBox id need to be update
tabItem(tabName = "mdljhhrvsrcCom",
                    fluidRow(
                      column(width = 12,
                             tabBox(title ="嘉好人资凭证SRC数据库查询",width = 12,
                                    id='tabSet_mdljhhrvsrcCom',height = '300px',
                                    #以上为注册ui组件的内容-----
                                    #begin----
                                    #uiComponent seperated by comma (,)
                                     # mdlDemoUI::buttonUI(),
                                     # mdlDemoUI::textUI(),
                                     # mdlDemoUI::dateUI(),
                                    mdljhhrvsrcUI::jhhrvsrcsalaryUI(),
                                    mdljhhrvsrcUI::jhhrvsrcsocialsecurityUI(),
                                    mdljhhrvsrcUI::jhhrvsrcdetailUI(),
                                    mdljhhrvsrcUI::jhhrvsrcrddetailUI(),
                                    mdljhhrvsrcUI::jhhrvsrcnonrddetailUI(),
                                    mdljhhrvsrcUI::jhhrvsrcrulevoucherUI(),
                                    mdljhhrvsrcUI::jhhrvsrctplvoucherUI(),
                                    # mdljhhrvsrcUI::jhhrvsrctploutputvoucherUI(),
                                    mdljhhrvsrcUI::jhhrvsrcfnoteUI(),
                                    mdljhhrvsrcUI::jhhrvsrcacctUI(),
                                    mdljhhrvsrcUI::jhhrvsrcdeptUI(),
                                    mdljhhrvsrcUI::jhhrvsrcacctreclassUI(),
                                    mdljhhrvsrcUI::jhhrvsrcworkcenterUI(),
                                    mdljhhrvsrcUI::jhhrvsrcrditemUI(),
                                    mdljhhrvsrcUI::jhhrvsrccosucompanyUI(),
                                    mdljhhrvsrcUI::jhhrvsrcdeptcomparisonUI(),
                                    mdljhhrvsrcUI::jhhrvsrcmiddleTableUI()
                                    
                                    #end----
                                    
                                    
                                    
                                    
                                    
                             )
                      )
                    )
)
 