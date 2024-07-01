import os
import pandas as pd
from sqlalchemy import create_engine


file_path = r'C:\Users\User\Desktop\ciclo 4\detenidos2020.csv'


if not os.path.isfile(file_path):
    print(f"Archivo no encontrado: {file_path}")
else:
    usuario = 'root'
    contraseña = 'UTPL2023'
    host = 'localhost'
    puerto = '3306'
    nombre_base_de_datos = 'bd_pruebaint'


    datos = pd.read_csv(file_path)


    motor = create_engine(f'mysql+mysqlconnector://{usuario}:{contraseña}@{host}:{puerto}/{nombre_base_de_datos}')


    datos.to_sql('detenidos2020', con=motor, if_exists='replace', index=False)