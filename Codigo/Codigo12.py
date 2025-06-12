def run_code(user_input):
    eval(user_input)  # Inseguro: esto debería generar una alerta en CodeQL

def safe_code():
    print("Esto es seguro.")
