c = get_config()

# Change from JupyterHub to JupyterLab
c.Spawner.default_url = '/lab'
c.Spawner.debug = True

c.JupyterHub.base_url = '/jupyter'

# Administrators - set of users who can administer the Hub itself
c.Authenticator.admin_users = {'admin'}
#c.Authenticator.whitelist={'Germany', 'user1', 'user2', 'user3', 'ubuntu', "Vietnam"}
