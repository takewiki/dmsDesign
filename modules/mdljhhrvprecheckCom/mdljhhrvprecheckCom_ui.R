#tabName need to be update
#tabBox title need to be update
#tabBox id need to be update
tabItem(tabName = "mdljhhrvprecheckCom",
                    fluidRow(
                      column(width = 12,
                             tabBox(title ="嘉好人资凭证数据源检查",width = 12,
                                    id='tabSet_mdljhhrvprecheckCom',height = '300px',
                                    #以上为注册ui组件的内容-----
                                    #begin----
                                    #uiComponent seperated by comma (,)
                                     # mdlDemoUI::buttonUI(),
                                     # mdlDemoUI::textUI(),
                                     # mdlDemoUI::dateUI(),
                                    # mdljhhrvprecheckUI::jhhrvUI()
                                    mdljhhrvprecheckUI::jhhrvodsUI(),
                                    mdljhhrvprecheckUI::jhhrvstdUI()

                                    
                                    #end----
                                    
                                    
                                    
                                    
                                    
                             )
                      )
                    )
)
 