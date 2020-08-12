import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.chrome.options import Options

def init_driver():
    chromeOptions = webdriver.ChromeOptions()
    chromeOptions.add_argument("--headless")
    chromeOptions.add_argument("--disable-gpu")
    chromeOptions.add_argument('--no-sandbox')
    driver = webdriver.Chrome(executable_path='/usr/bin/chromedriver',chrome_options=chromeOptions)
    return driver

def login(user, passw):
    driver.get("http://")
    try:
        #print(driver.page_source)
        LoginTextBox = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "LoginTextBox")))
        PasswordTextBox = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "PasswordTextBox")))
        LoginButton = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "LoginButton")))
        log = driver.find_element_by_id("LoginTextBox")
        log.send_keys(user)
        pas = driver.find_element_by_id("PasswordTextBox")
        pas.send_keys(passw)
        butt = driver.find_element_by_id("LoginButton")
        butt = driver.find_element_by_id("LoginButton").click()
        time.sleep(5)
#        wait = WebDriverWait(driver, 10)
        try:
            tit = WebDriverWait(driver, 5).until(EC.title_is("Interfax - News"))
            #print("page is ready!")
            sign = driver.find_element_by_xpath('//*[@id="ctl00_cplMenu_TopMenu1_userInfo_PersonalManagerPanelDiv"]/table/tbody/tr[2]/td')
#            print(sign.text)
            if sign.text == "Subscription expiration: 03/06/2023":
                print("OK")
        except Exception:
            print("Error Login")
    except TimeoutException:
        print("Check User or Pass")

if __name__ == "__main__":
    driver = init_driver()
    user = "login"
    passw = "pass"
    login(user, passw)
    time.sleep(2)
    driver.quit()
