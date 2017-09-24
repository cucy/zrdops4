for i in range(200):
	User.objects.create_user('zrd{}'.format(i), "zrdemail{}@zrd.com".format(i), '123456')