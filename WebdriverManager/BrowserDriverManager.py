from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager

def get_browser_driver_path():
    driver_path = ChromeDriverManager().install()
    print(driver_path)
    return driver_path