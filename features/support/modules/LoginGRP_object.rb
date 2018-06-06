module LoginObject
    
    include Capybara::DSL

      URL = 'https://www.polistrial.com.br/#!/login'

      def visit
        super(URL) #This goes to the Begin Page
      end

      def setemail(email)
         find(:xpath, @field_login).set(email)
      end

      def setpassword(senha)
      	  find(:xpath, @field_password).send_keys(senha)
          click_login_button
      end

      def click_login_button
          click_on(@button_login)
      end
      
      def click_menu_button
          find(:xpath, @button_menu).click
      end

      def click_leave_option
          find(:css, @option_leave).click   
      end

      def leave_Polis
          click_menu_button
          click_leave_option
      end
end
