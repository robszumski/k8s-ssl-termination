Uses the Caddy webserver and Lets Encrypt to provide SSL termination for a backend service.

Configure with env vars:

| Variable | Default | Description |
|----------|---------|-------------|
| `CADDY_HOSTNAME` | _none_ | The domain that will be terminated |
| `CADDY_EMAIL` | _none_ | Email address used to request the TLS certificate |
| `CADDY_BACKEND` | localhost:80 | Location of the backend where traffic will be sent |
