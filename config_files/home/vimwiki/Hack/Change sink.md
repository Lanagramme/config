# Set default sink for pipewire

List all sinks
```bash
wpctl status
```
Note the id of the sink to use

Define default sink
```bash
wpctl set-default $id
```
