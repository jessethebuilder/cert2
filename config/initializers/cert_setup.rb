#Certs Steps:
# 1. Install devise
# 2. Get Migrations from FarmTools(app:farm_tools_engine:install:migrations)
# 3. db:migrate
# 4. add "//= require certs" to the bottom of application.css.scss
# 5. add "//= require certs" to application.js
# 6. Set values in omniauth initializer

::GIVING_OPTIONS = %w|facebook twitter email mail|

::FB_APP_NAME = 'Certs Demo'
::FB_ID = '1415494142042598'
::FB_SECRET = '02482a89d8988daf8cb3bae9d05cbfac'

::FB_PERMISSIONS = 'email'

