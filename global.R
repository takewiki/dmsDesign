# 设置app标题-----

app_title <-'棱星数据中台演示版V1.0';

# store data into rdbe in the rds database
app_id <- 'dmsDemo'
#upload all the library

#设置链接---


#后续使用token取代数据库的配置文件
# erp_token ='C0426D23-1927-4314-8736-A74B2EF7A039'


dms_token = '057A7F0E-F187-4975-8873-AF71666429AB'

tstk::import(app_id = app_id)


# 加载R包-----

source('00_data.R',encoding = 'utf-8')













