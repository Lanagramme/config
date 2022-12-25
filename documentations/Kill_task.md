## print all processes
```bash
ps aux
```
## Kill procces by PID
```bash
kill -9 process_PID
```
## kill process by port number
```bash
kill -9 $(lsof -t -i:port)
```
