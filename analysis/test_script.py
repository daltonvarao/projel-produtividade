from datetime import datetime

with open('/tmp/test_script.log','a',encoding='utf-8') as f:
    f.write(datetime.now().strftime('%Y-%m-%d %H:%M:%S') + "\n")