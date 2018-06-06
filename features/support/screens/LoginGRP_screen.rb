
class LoginPolis

    include Singleton
	include LoginObject
 
	def initialize
		@field_login = '//*[@id="authEmail"]'
        @field_password = '//*[@id="authPassword"]'
        @button_login = 'authSubmit'
        @alert_error_password = '//*[@id="swal2-title"]'
        @alert_error_button_ok = 'body/div[3]/div[1]/div[3]/button[1]'
        @screen_map = '//*[@id="map"]/div[1]/div[1]/div[1]/div[1]/div[3]/div[1]'
        @button_menu = '//*[@id="dropdownMenuButton"]/i[1]'
        @option_leave ='.header-menu.show .dropdown-menu .dropdown-item[ng-click="$ctrl.logout()"]'
	end
end	