import csv
import os
from datetime import datetime

class CustomCSVReader:
    def __init__(self, filepath, delimiter=';'):
        self.filepath = filepath
        self.delimiter = delimiter

    def read(self):
        with open(self.filepath, mode='r', encoding='utf-8-sig') as file:
            reader = csv.DictReader(file, delimiter=self.delimiter)
            return [row for row in reader]

def escribir_datos_txt(archivo, filepath):
    with open(filepath, 'a', encoding='utf-8') as escritor:
        escritor.write(archivo + '\n')

def Edad(valor):
    return valor.replace("SIN DATO", "")

def Fragante_boleta(valor):
    if valor == "FLAGRANTE":
        return "SI"
    elif valor == "BOLETA":
        return "NO"
    else:
        return valor

def hora(valor):
    time_obj = datetime.strptime(valor, '%I:%M:%S %p')
    time_24h_str = time_obj.strftime('%H:%M:%S')
    return time_24h_str

def fecha(valor):
    date_obj = datetime.strptime(valor, '%d/%m/%Y')
    new_date_str = date_obj.strftime('%y/%m/%d')
    return new_date_str

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO armas(arma_id, tipo_arma, arma) "
        "VALUES('%d', '%s', '%s');"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["arma"].strip()),
                comillas_raras(row["tipo_arma"].strip())
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)


def main():
    ruta_csv = r'C:\Users\ruben\Desktop\Proyectos\Proyecto_integra2\anios_detenidos\2021.csv'
    ruta_txt = r'C:\Users\ruben\Desktop\Proyectos\Proyecto_integra2\Scrip\Scrip.sql'

    reader = CustomCSVReader(ruta_csv)
    content_file = reader.read()
    generar_data_goals(content_file, ruta_txt)

if __name__ == "__main__":
    main()
