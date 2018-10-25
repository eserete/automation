module LoginObject
    
    include Capybara::DSL

      URL = 'https://google.com'

      def visit
        super(URL) #This goes to the Begin Page
      end

      def setemail(email)
         find(:id, 'lst3-ib').set(email)
      end

      def setpassword(senha)
          click_login_button
      end

      def click_login_button
        find(:xpath, @button_login).click
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
