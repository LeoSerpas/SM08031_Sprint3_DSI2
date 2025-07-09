from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# Inicializar Edge WebDriver
service = Service("drivers/msedgedriver.exe")
driver = webdriver.Edge(service=service)

# Abrir la URL del formulario
driver.get("http://127.0.0.1:8080/alumnos/create")

# Rellenar campos del alumno
WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.NAME, "nombres"))).send_keys("Juan")
driver.find_element(By.NAME, "apellidos").send_keys("Pérez")
driver.find_element(By.NAME, "nie").send_keys("1234567")
driver.find_element(By.NAME, "fecha_nacimiento").send_keys("2010-05-12")

# Dropdowns
Select(driver.find_element(By.NAME, "estudio_parvularia")).select_by_index(1)
Select(driver.find_element(By.NAME, "padece_enfermedad")).select_by_index(1)
driver.find_element(By.NAME, "descripcion_enfermedad").send_keys("Ninguna")

# Datos de los padres
driver.find_element(By.NAME, "nombre_madre").send_keys("María")
driver.find_element(By.NAME, "dui_madre").send_keys("012345678-9")
driver.find_element(By.NAME, "ocupacion_madre").send_keys("Docente")
driver.find_element(By.NAME, "telefono_madre").send_keys("70001234")

driver.find_element(By.NAME, "nombre_padre").send_keys("Carlos")
driver.find_element(By.NAME, "dui_padre").send_keys("123456789-0")
driver.find_element(By.NAME, "ocupacion_padre").send_keys("Ingeniero")
driver.find_element(By.NAME, "telefono_padre").send_keys("70005678")

# Otros datos del alumno
Select(driver.find_element(By.NAME, "vive_con")).select_by_index(1)
Select(driver.find_element(By.NAME, "nuevo_ingreso")).select_by_index(1)
Select(driver.find_element(By.NAME, "carta_compromiso")).select_by_index(1)
driver.find_element(By.NAME, "escuela_procedencia").send_keys("Centro Escolar XYZ")
driver.find_element(By.NAME, "municipio_procedencia").send_keys("San Salvador")
Select(driver.find_element(By.NAME, "rendimiento_anterior")).select_by_index(1)

# Enviar el formulario
driver.find_element(By.XPATH, "//button[text()='Guardar']").click()

# Esperar y cerrar
print("Formulario enviado correctamente. Esperando 30 segundos...")
time.sleep(30)
driver.quit()
