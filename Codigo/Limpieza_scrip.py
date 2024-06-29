import csv
import os

class CustomFormat:
    delimiter = ';'

def ejecutable():
    ruta = r'C:\Users\ruben\Desktop\Proyectos\Proyecto_integra2\anios_detenidos\2021.csv'
    
    # Leer el archivo CSV con el delimitador personalizado
    with open(ruta, mode='r', encoding='utf-8-sig') as file:
        reader = csv.DictReader(file, delimiter=CustomFormat.delimiter)
        contentFile = [row for row in reader]

    def valoresDoBuedos(valor):
        if valor in ["not available", "not applicable", "NA", "\\s"]:
            return 0
        else:
            return float(valor)

    def comillasRaras(valor):
        return valor.replace("'", "\\'")

    def escribirDatosTXT2(archivo):
        rutaTXT = r'C:\Users\ruben\Desktop\Proyectos\Proyecto_integra2\Scrip\Scrip.sql'
        with open(rutaTXT, 'a', encoding='utf-8') as escritor:
            escritor.write(archivo)
            escritor.write('\n')

    def generarDataGoals(data):
        nombreTXT = "goals.sql"
        insertFormat = (
            "INSERT INTO goals(goals_team_id, goals_tournament_id, goals_player_id, "
            "goals_player_team_id, goals_goal_id, goals_minute_label, goals_minute_regulation, "
            "goals_minute_stoppage, goals_match_period, goals_own_goal, goals_penalty) "
            "VALUES('%s', '%s', '%s', '%s', '%s', '%s', %d, %d, '%s', %d, %d);"
        )

        for x in data:
            if comillasRaras(x["goals_team_id"].strip()) != "NA":
                insertValues = (
                    comillasRaras(x["goals_team_id"].strip()),
                    comillasRaras(x["matches_tournament_id"].strip()),
                    comillasRaras(x["goals_player_id"].strip()),
                    comillasRaras(x["goals_player_team_id"].strip()),
                    comillasRaras(x["goals_goal_id"].strip()),
                    comillasRaras(x["goals_minute_label"].strip()),
                    int(valoresDoBuedos(x["goals_minute_regulation"].strip())),
                    int(valoresDoBuedos(x["goals_minute_stoppage"].strip())),
                    comillasRaras(x["goals_match_period"].strip()),
                    int(valoresDoBuedos(x["goals_own_goal"].strip())),
                    int(valoresDoBuedos(x["goals_penalty"].strip()))
                )

                sql_statement = insertFormat % insertValues
                escribirDatosTXT2(sql_statement)

    generarDataGoals(contentFile)

if __name__ == "__main__":
    ejecutable()
