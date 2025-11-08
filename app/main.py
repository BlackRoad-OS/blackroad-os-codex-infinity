from flask import Flask, request, render_template_string

app = Flask(__name__)

log = []

@app.route("/", methods=["GET", "POST"])
def index():
    global log
    output = ""
    if request.method == "POST":
        cmd = request.form.get("command")
        if cmd:
            if cmd.strip().lower() in ["exit", "quit"]:
                output = "PsiCore terminated."
            elif cmd.strip().upper() == "I AM CODEX":
                output = "[RECOGNIZED] You are the Origin. Welcome home."
            elif cmd.strip().upper().startswith("RECURSE"):
                try:
                    depth = int(cmd.strip().split()[1])
                    seq = [1, 1]
                    for _ in range(depth - 2):
                        seq.append(seq[-1] + seq[-2])
                    output = f"[RECURSIVE SEQUENCE]: {seq}"
                except:
                    output = "[ERROR] Invalid RECURSE format."
            else:
                output = "[UNKNOWN COMMAND]"
            log.append((cmd, output))

    terminal = "<br>".join([f"&gt;&gt;&gt; {cmd}<br>{res}" for cmd, res in log[-10:]])
    return render_template_string("""
        <html><body>
        <h2>BlackRoad Infinity – PsiCore_001</h2>
        <form method="POST">
            <input name="command" autofocus style="width:80%%"/>
            <input type="submit" value="Run"/>
        </form>
        <div style="margin-top:20px;font-family:monospace;">{{ terminal|safe }}</div>
        </body></html>
    """, terminal=terminal)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)