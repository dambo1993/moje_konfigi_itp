from datetime import datetime

if len(sys.argv) == 3:
    if sys.argv[1] == "-t":
        timestamp = sys.argv[2]
        dt_object = datetime.fromtimestamp(int(timestamp))
        print(f"Date from timestamp: {timestamp} -> {dt_object}")