  ##########---DADO---##########

  Dado(/^que usuário acesse a tela de login do sistema Polis$/) do
    @login = IntanceObject.instance_object :LoginPolis
    @login.visit
  end

  ##########---QUANDO---##########

  Quando(/^informar um (.*)$/) do |email|
    @login = IntanceObject.instance_object :LoginPolis
    @login.setemail(email)
  end

  Quando(/^(.*) válida, clicar no botão log_in$/) do |senha|
    @login = IntanceObject.instance_object :LoginPolis
    @login.setpassword(senha)
  end

  Quando(/^(.*) inválida, clicar no botão log_in$/) do |senha|
    @login = IntanceObject.instance_object :LoginPolis
    @login.setpassword(senha)
  end

  Quando(/^(?:deve fazer|fizer) logout do sistema Polis$/) do
    @login = IntanceObject.instance_object :LoginPolis
    @login.leave_Polis
  end

  ##########---ENTAO---##########

  Então(/^o sistema deve exibir uma mensagem de erro$/) do
    sleep(6)
    expect(page).to have_xpath('//*[@id="swal2-title"]')
  end

  Então(/^o sistema deve permitir a autenticação do usuário$/) do
    sleep(6)
    expect(page).to have_xpath('//*[@id="map"]/div[1]/div[1]/div[1]/div[1]/div[3]/div[1]')
  end





