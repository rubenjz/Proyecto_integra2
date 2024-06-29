import csv
import os

class CustomCSVReader:
    def __init__(self, filepath, delimiter=';'):
        self.filepath = filepath
        self.delimiter = delimiter

    def read(self):
        with open(self.filepath, mode='r', encoding='utf-8-sig') as file:
            reader = csv.DictReader(file, delimiter=self.delimiter)
            return [row for row in reader]

def valores_do_buedos(valor):
    if valor in ["not available", "not applicable", "NA", "\\s"]:
        return 0
    try:
        return float(valor)
    except ValueError:
        return 0

def comillas_raras(valor):
    return valor.replace("'", "\\'")

def escribir_datos_txt(archivo, filepath):
    with open(filepath, 'a', encoding='utf-8') as escritor:
        escritor.write(archivo + '\n')

def generar_data_goals(data, output_filepath):
    insert_format = (
        "INSERT INTO goals(goals_team_id, goals_tournament_id, goals_player_id, "
        "goals_player_team_id, goals_goal_id, goals_minute_label, goals_minute_regulation, "
        "goals_minute_stoppage, goals_match_period, goals_own_goal, goals_penalty) "
        "VALUES('%s', '%s', '%s', '%s', '%s', '%s', %d, %d, '%s', %d, %d);"
    )

    for row in data:
        if comillas_raras(row["goals_team_id"].strip()) != "NA":
            insert_values = (
                comillas_raras(row["goals_team_id"].strip()),
                comillas_raras(row["matches_tournament_id"].strip()),
                comillas_raras(row["goals_player_id"].strip()),
                comillas_raras(row["goals_player_team_id"].strip()),
                comillas_raras(row["goals_goal_id"].strip()),
                comillas_raras(row["goals_minute_label"].strip()),
                int(valores_do_buedos(row["goals_minute_regulation"].strip())),
                int(valores_do_buedos(row["goals_minute_stoppage"].strip())),
                comillas_raras(row["goals_match_period"].strip()),
                int(valores_do_buedos(row["goals_own_goal"].strip())),
                int(valores_do_buedos(row["goals_penalty"].strip()))
            )

            sql_statement = insert_format % insert_values
            escribir_datos_txt(sql_statement, output_filepath)

def main():
    ruta_csv = "D:/Users/LENOVO/Documents/ESTA CARPETA ESTA ORGANIZADA/ArchivoPIntegrador/dsAlineacionesXTorneo.csv"
    ruta_txt = "D:/Users/LENOVO/Documents/ESTA CARPETA ESTA ORGANIZADA/scriptInsertIntos.sql"

    reader = CustomCSVReader(ruta_csv)
    content_file = reader.read()
    generar_data_goals(content_file, ruta_txt)

if __name__ == "__main__":
    main()
