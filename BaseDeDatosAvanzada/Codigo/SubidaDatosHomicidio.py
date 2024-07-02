import pandas as pd
from sqlalchemy import create_engine

# Configuración de la bd
engine = create_engine('mysql+mysqlconnector://root:UTPL2023@localhost:3306/db_integrador2')

# Listo los archivos CSV y pongo sus encabezados correspondientes
csv_files_homicidios = {
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2016Homi.csv': [
        'Tipo Muert.', 'Zona', 'Subzona', 'Area del Hecho', 'Lugar', 'Fecha Infraccion',
        'Tipo Arma', 'Presunta Motivacion Observacion', 'Sexo', 'Estado Civil', 'Nacionalidad', 'Instruccion'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2017Homi.csv': [
        'Tipo Muert.', 'Zona', 'Subzona', 'Area del Hecho', 'Lugar', 'Fecha Infraccion',
        'Tipo Arma', 'Presunta Motivacion Observacion', 'Sexo', 'Estado Civil', 'Nacionalidad', 'Instruccion'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2018Homi.csv': [
        'Tipo Muert.', 'Zona', 'Subzona', 'Area del Hecho', 'Lugar', 'Fecha Infraccion',
        'Tipo Arma', 'Presunta Motivacion Observacion', 'Sexo', 'Estado Civil', 'Nacionalidad', 'Instruccion'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2019Homi.csv': [
        'Tipo Muert.', 'Zona', 'Subzona', 'Area del Hecho', 'Lugar', 'Fecha Infraccion',
        'Tipo Arma', 'Presunta Motivacion Observacion', 'Sexo', 'Estado Civil', 'Nacionalidad', 'Instruccion'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2020Homi.csv': [
        'Tipo Muert.', 'Zona', 'Subzona', 'Area del Hecho', 'Lugar', 'Fecha Infraccion',
        'Tipo Arma', 'Presunta Motivacion Observacion', 'Sexo', 'Estado Civil', 'Nacionalidad', 'Instruccion'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/2021Homi.csv': [
        'Tipo Muert.', 'Zona', 'Subzona', 'Area del Hecho', 'Lugar', 'Fecha Infraccion',
        'Tipo Arma', 'Presunta Motivacion Observacion', 'Sexo', 'Estado Civil', 'Nacionalidad', 'Instruccion'
    ],
    'C:/Users/User/Desktop/RepoInte/Proyecto_integra2/BaseDeDatosAvanzada/anios_detenidos_NOlimpios/Homi2022.csv': [
        'Tipo Muert.', 'Zona', 'Subzona', 'Area del Hecho', 'Lugar', 'Fecha Infraccion',
        'Tipo Arma', 'Presunta Motivacion Observacion', 'Sexo', 'Estado Civil', 'Nacionalidad', 'Instruccion'
    ]
}

# Mapeo los encabezados a las columnas de la tabla Homicidios
column_mapping_homicidios = {
    'Tipo Muert.': 'tipo_muerte',
    'Zona': 'zona',
    'Subzona': 'subzona',
    'Area del Hecho': 'area_del_hecho',
    'Lugar': 'lugar',
    'Fecha Infraccion': 'fecha_infraccion',
    'Tipo Arma': 'tipo_arma',
    'Presunta Motivacion Observacion': 'presunta_motivacion_observacion',
    'Sexo': 'sexo',
    'Estado Civil': 'estado_civil',
    'Nacionalidad': 'nacionalidad',
    'Instruccion': 'instruccion'
}

def process_and_load_csv_homicidios(file_path, headers):
    try:
        # Lee el archivo CSV
        df = pd.read_csv(file_path, delimiter=',', encoding='utf-8', skip_blank_lines=True)

        # Eliminar columnas no deseadas
        df = df.iloc[:, :len(headers)]

        # Asigna los encabezados
        df.columns = headers

        # Mapea los nombres de columnas a los nombres de la tabla Homicidios
        df = df.rename(columns={header: column_mapping_homicidios.get(header, header) for header in headers})

        # Convierto NaN a None para que se almacenen como NULL en MySQL
        df = df.where(pd.notnull(df), None)

        # Formatear fechas si es necesario
        if 'fecha_infraccion' in df.columns:
            df['fecha_infraccion'] = pd.to_datetime(df['fecha_infraccion'], errors='coerce').dt.date

        # Inserto los datos en la base de datos
        df.to_sql('homicidios', con=engine, if_exists='append', index=False)
        print(f'Datos del archivo {file_path} cargados exitosamente.')

    except Exception as e:
        print(f'Error al procesar el archivo {file_path}: {e}')

# Proceso cada archivo CSV
for csv_file, headers in csv_files_homicidios.items():
    process_and_load_csv_homicidios(csv_file, headers)