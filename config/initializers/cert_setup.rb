#Certs Steps:
# 1. Install devise
# 2. Get Migrations from FarmTools(app:farm_tools_engine:install:migrations)
# 3. db:migrate
# 4. add "//= require certs" to the bottom of application.css.scss
# 5. add "//= require certs" to application.js
# 6. Set values in omniauth initializer

::GIVING_OPTIONS = %w|facebook twitter email mail|

::FB_ID = '1405477876366613'
::FB_SECRET = '411d2788e5cd4d73765b276dfae33476'
::FB_PERMISSIONS = 'email'

