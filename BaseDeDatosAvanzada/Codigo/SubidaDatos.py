import pandas as pd
from sqlalchemy import create_engine
import numpy as np

# Configuración de la bd
engine = create_engine('mysql+mysqlconnector://root:UTPL2023@localhost:3306/db_integrador2')

# Listo los archivos CSV y pongo sus encabezados correspondientes
csv_files = {
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2016.csv': [
        'Zona', 'Subzona', 'Canton', 'Presunta_Subinfraccion', 'Fecha de Detencion',
        'Flagrante/Boleta', 'Sexo', 'Edad', 'Nacionalidad'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2017.csv': [
        'Zona', 'Subzona', 'Canton', 'Presunta_Subinfracción', 'Fecha de Detencion',
        'Flagrante/Boleta', 'Sexo', 'Edad', 'Nacionalidad'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2018.csv': [
        'Zona', 'Subzona', 'Canton', 'Presunta_Subinfraccion', 'Fecha de Detencion',
        'Flagrante/Boleta', 'Sexo', 'Edad', 'Nacionalidad'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2019.csv': [
        'Zona', 'Subzona', 'Canton', 'Presunta_Subinfraccion', 'Fecha de Detencion',
        'Sexo', 'Edad', 'Nacionalidad'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2020.csv': [
        'Zona', 'Subzona', 'Canton', 'Presunta_Subinfraccion', 'Fecha de Detencion',
        'Sexo', 'Edad', 'Nacionalidad'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2021.csv': [
        'Zona', 'Subzona', 'Canton', 'Presunta_Subinfraccion', 'Fecha de Detencion',
        'Sexo', 'Edad', 'Nacionalidad'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2022.csv': [
        'tipo', 'edad', 'sexo', 'nacionalidad', 'autoidentificacion_etnica',
        'numero_detenciones', 'nombre_provincia', 'Canton', 'nombre_parroquia',
        'Zona', 'Subzona', 'nombre_distrito', 'codigo_distrito',
        'nombre_circuito', 'codigo_circuito', 'nombre_subcircuito', 'codigo_subcircuito',
        'lugar', 'presunta_infraccion', 'presunta_subinfraccion', 'Fecha_Detencion',
        'hora_detencion_aprehension', 'presunta_flagrancia'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2023.csv': [
            "codigo_iccs", "tipo", "estado_civil", "estatus_migratorio", "edad", "sexo", "genero",
            "nacionalidad", "autoidentificacion_etnica", "numero_detenciones", "nivel_de_instruccion",
            "condicion", "movilizacion", "tipo_arma", "arma", "Fecha_Detencion", "hora_detencion_aprehension",
            "lugar", "tipo_lugar", "codigo_distrito", "codigo_circuito", "codigo_subcircuito", "Zona", "Subzona",
            "nombre_distrito", "nombre_circuito", "nombre_subcircuito", "codigo_provincia", "codigo_canton",
            "codigo_parroquia", "nombre_provincia", "Canton", "nombre_parroquia", "presunta_flagrancia",
            "presunta_infraccion", "Presunta_Subinfracción", "presunta_modalidad"
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2024.csv': [
        'codigo_iccs', 'tipo', 'estado_civil', 'estatus_migratorio', 'edad', 'sexo',
        'genero', 'nacionalidad', 'autoidentificacion_etnica', 'numero_detenciones',
        'nivel_de_instruccion', 'condicion', 'movilizacion', 'tipo_arma', 'arma',
        'fecha_detencion_aprehension', 'hora_detencion_aprehension', 'lugar', 'tipo_lugar',
        'codigo_distrito', 'codigo_circuito', 'codigo_subcircuito', 'Zona',
        'Subzona', 'nombre_distrito', 'nombre_circuito', 'nombre_subcircuito',
        'codigo_provincia', 'codigo_canton', 'codigo_parroquia', 'nombre_provincia',
        'Canton', 'nombre_parroquia', 'presunta_flagrancia', 'presunta_infraccion',
        'presunta_subinfraccion', 'presunta_modalidad'
    ]
}

# Mapeo los encabezados a las columnas de la tabla desnormalizada
column_mapping = {
    'Zona': 'zona',
    'Subzona': 'subzona',
    'Canton': 'canton',
    'Presunta_Subinfracción': 'presunta_subinfraccion',
    'Presunta_Subinfraccion': 'presunta_subinfraccion',
    'Fecha de Detencion': 'fecha_detencion',
    'Fecha_Detencion': 'fecha_detencion',
    'Flagrante/Boleta': 'flagrante_boleta',
    'Sexo': 'sexo',
    'Edad': 'edad',
    'Nacionalidad': 'nacionalidad',
    'tipo': 'tipo',
    'autoidentificacion_etnica': 'autoidentificacion_etnica',
    'numero_detenciones': 'numero_detenciones',
    'nombre_provincia': 'nombre_provincia',
    'nombre_parroquia': 'nombre_parroquia',
    'nombre_distrito': 'nombre_distrito',
    'codigo_distrito': 'codigo_distrito',
    'nombre_circuito': 'nombre_circuito',
    'codigo_circuito': 'codigo_circuito',
    'nombre_subcircuito': 'nombre_subcircuito',
    'codigo_subcircuito': 'codigo_subcircuito',
    'lugar': 'lugar',
    'presunta_infraccion': 'presunta_infraccion',
    'fecha_detencion_aprehension': 'fecha_detencion',
    'hora_detencion_aprehension': 'hora_detencion',
    'presunta_flagrancia': 'presunta_flagrancia',
    'codigo_iccs': 'codigo_iccs',
    'estado_civil': 'estado_civil',
    'estatus_migratorio': 'estatus_migratorio',
    'genero': 'genero',
    'nivel_de_instruccion': 'nivel_de_instruccion',
    'condicion': 'condicion',
    'movilizacion': 'movilizacion',
    'tipo_arma': 'tipo_arma',
    'arma': 'arma',
    'tipo_lugar': 'tipo_lugar',
    'codigo_provincia': 'codigo_provincia',
    'codigo_canton': 'codigo_canton',
    'codigo_parroquia': 'codigo_parroquia',
    'presunta_modalidad': 'presunta_modalidad'
}

def process_and_load_csv(file_path, headers):
    try:
        # Lee el archivo CSV
        df = pd.read_csv(file_path, delimiter=',', encoding='utf-8')

        # Eliminar columnas no deseadas
        df = df.iloc[:, :len(headers)]

        # Asigna los encabezados
        df.columns = headers

        # Mapea los nombres de columnas a los nombres de la tabla desnormalizada
        df = df.rename(columns={header: column_mapping.get(header, header) for header in headers})

        # Convierto NaN a None para que se almacenen como NULL en MySQL
        df = df.where(pd.notnull(df), None)

        # Formatear fechas si es necesario
        if 'fecha_detencion' in df.columns:
            df['fecha_detencion'] = pd.to_datetime(df['fecha_detencion'], errors='coerce').dt.date

        # Inserto los datos en la base de datos
        df.to_sql('detenidos1', con=engine, if_exists='append', index=False)
        print(f'Datos del archivo {file_path} cargados exitosamente.')

    except Exception as e:
        print(f'Error al procesar el archivo {file_path}: {e}')

# Proceso cada archivo CSV
for csv_file, headers in csv_files.items():
    process_and_load_csv(csv_file, headers)