# frozen_string_literal: true

require "appium_lib"

class BaseScreen
  # aguarda elemento ser exibido na tela por id e oculta teclado
  def digita_valor(identificator, key)
    manage.timeouts.implicit_wait = 20
    find_element(:id, identificator).send_keys CREDENCIAL[key]
    hide_keyboard
  rescue StandardError => e
    raise e
  end
  
  # método para ocultar o teclado (nao falha se o teclado estiver oculto)
  def hide_keyboard
    $driver.hide_keyboard
  rescue Exception => e
    puts e
  end
  
  # método para mostrar o teclado (nao falha se o teclado estiver sendo exibido)
  def show_keyboard
    $driver.is_keyboard_shown
  rescue Exception => e
    puts e
  end

  # método para esperar um elemento mapeado estar visível na tela por xpath durante 10s.
  def wait_for_xpath(xpath, timeout = 10)
    @driver.wait_true(timeout) do
      @driver.exists { @driver.find_element(:xpath, xpath) }
    end
  end

  # método para esperar um elemento mapeado estar visível na tela por id durante 10s.
  def wait_for_id(id, timeout = 10)
    @driver.wait_true(timeout) do
      @driver.exists { @driver.find_element(:id, id) }
    end
  end

  # método para clicar um elemento mapeado na tela por id.
  def click_id(id)
    @driver.find_element(:id, id).click
  end

  # método para clicar um elemento mapeado na tela por xpath.
  def click_xpath(xpath)
    @driver.find_element(:xpath, xpath).click
  end

  # método para preencher um campo mapeado na tela por id.
  def send_keys_id(id, field)
    @driver.find_element(:id, id).send_keys(field)
  end

  # método para preencher um campo mapeado na tela por xpath.
  def send_keys_xpath(xpath, field)
    @driver.find_element(:xpath, xpath).send_keys(field)
  end

  # aguarda elemento ser exibido na tela por id
  def wait_for_element_exists_by_id(identificator)
    manage.timeouts.implicit_wait = 20
    find_element(:id, identificator).displayed?
  rescue StandardError => e
    raise e
  end

  # aguarda elemento ser exibido na tela por xpath
  def wait_for_element_exists_by_xpath(identificator, time)
    wait_true(time) { @driver.find_element(:xpath, identificator).displayed? }
  rescue StandardError => e
    raise e
  end

  # aguarda elemento ser exibido na tela por class
  def wait_for_element_exists_by_class(identificator, time)
    wait_true(time) { @driver.find_element(:class, identificator).displayed? }
  rescue StandardError => e
    raise e
  end

  # wait_for_click(:id 'xpto')
  def wait_for_click(atributos)
    manage.timeouts.implicit_wait = 20
    find_element(atributos).click
  end

  # método para coletar o texto do elemento. Uso = get_element_text(:id 'xpto').text ou .value
  def get_element_text(identificator)
    manage.timeouts.implicit_wait = 20
    find_element(identificator)
  end

  # método para coletar o texto do elemento. Uso = get_elements_text(:id 'xpto')[posicao do array].text ou .value
  def get_elements_text(identificator)
    manage.timeouts.implicit_wait = 20
    find_elements(identificator)
  end
  
  # get_element_displayed(:id 'xpto')
  def get_element_displayed(identificator)
    manage.timeouts.implicit_wait = 20
    find_element(identificator).displayed?
  end
  
  # método para rolar a tela por texto. Uso = scroll("texto")
  def scroll_text(texto)
    manage.timeouts.implicit_wait = 20
    driver.scroll_to(texto)
  end

  # método para rolar a tela por elemento. Uso = scrollTo(@inicial, @final)
  def scroll_element(el_start, el_end)
    #get element coordinates start
    el_start = $driver.find_element(:id, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    #get element coordinates end
    el_end = $driver.find_element(:id, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
    Appium::TouchAction.new.swipe(start_x: screen_x_start, start_y: screen_y_start, delta_x: screen_x_end, delta_y: screen_y_end).perform
  end

  # método para rolar a tela por tamanho da tela. Uso = scroll_position(30, 70)
  def scroll_position(inicio, fim)
    #get element coordinates start
    screen_x_start = window_size.width/2
    screen_y_start = window_size.height/100*inicio
    #get element coordinates end
    screen_x_end = window_size.width/2
    screen_y_end = window_size.height/100*fim
    Appium::TouchAction.new.swipe(start_x: screen_x_start, start_y: screen_y_start, delta_x: screen_x_end, delta_y: screen_y_end).perform
  end
end