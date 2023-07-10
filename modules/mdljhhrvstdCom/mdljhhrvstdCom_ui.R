#tabName need to be update
#tabBox title need to be update
#tabBox id need to be update
tabItem(tabName = "mdljhhrvstdCom",
                    fluidRow(
                      column(width = 12,
                             tabBox(title ="嘉好人资凭证STD数据库查询",width = 12,
                                    id='tabSet_mdljhhrvstdCom',height = '300px',
                                    #以上为注册ui组件的内容-----
                                    #begin----
                                    #uiComponent seperated by comma (,)
                                     # mdlDemoUI::buttonUI(),
                                     # mdlDemoUI::textUI(),
                                     # mdlDemoUI::dateUI(),
                                    mdljhhrvstdUI::jhhrvstdsalaryUI(),
                                    mdljhhrvstdUI::jhhrvstdsocialsecurityUI()

                                    
                                    #end----
                                    
                                    
                                    
                                    
                                    
                             )
                      )
                    )
)
 