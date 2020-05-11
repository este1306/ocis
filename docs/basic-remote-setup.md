---
title: "Basic Remote Setup"
date: 2020-02-27T20:35:00+01:00
weight: 16
geekdocRepo: https://github.com/owncloud/ocis
geekdocEditPath: edit/master/docs
geekdocFilePath: basic-remote-setup.md
---

{{< toc >}}

Out of the box the ocis single binary and the `owncloud/ocis` docker image are configured to run on localhost for quick testing and development.

If you need to access ocis on a VM or a remote machine e.g when testing a mobile client you need to configure ocis to run on a different host.

## Use the binary

If you start the ocis fullstack for the first time with `./bin/ocis server` it will generate a file `identifier-registration.yml` in the config folder relative to its location. This file is used to configure the clients for the built-in Identity Provider.

{{< hint warning >}}
**Outdated version**\
This file `identifier-registration.yml` will only be generated if there is no such file in place. You could miss updates on this file.
{{< /hint >}}

### Add your hostname to the idp config

Let us assume `your-host` is your remote domain name or IP adress. In this example we do not change the default port (`9200`). But this could be changed to another port.

```yaml {linenos=table,hl_lines=["13-14",18]}
# OpenID Connect client registry.
clients:
  - id: phoenix
    name: ownCloud web app
    application_type: web
    insecure: yes
    trusted: yes
    redirect_uris:
      - http://localhost:9100/oidc-callback.html
      - http://localhost:9100/
      - https://localhost:9200/
      - https://localhost:9200/oidc-callback.html
      - https://your-host:9200/
      - https://your-host:9200/oidc-callback.html
    origins:
      - http://localhost:9100
      - https://localhost:9200
      - https://your-host:9200/
```

### Start the ocis fullstack server

You need to configure `your-host` in some services to provide the needed public resources. oCIS currently needs a running Redis Server reachable locally on the machine at the default port (`localhost:6379`). You can change this using the following option `REVA_STORAGE_OWNCLOUD_REDIS_ADDR=some-host:6379`.

```bash
PROXY_HTTP_ADDR=0.0.0.0:9200 \
KONNECTD_ISS=https://your-host:9200 \
REVA_OIDC_ISSUER=https://your-host:9200 \
PHOENIX_OIDC_AUTHORITY=https://your-host:9200 \
PHOENIX_WEB_CONFIG_SERVER=https://your-host:9200 \
PHOENIX_OIDC_METADATA_URL=https://your-host:9200/.well-known/openid-configuration \
PROXY_TRANSPORT_TLS_KEY=./certs/your-host.key \
PROXY_TRANSPORT_TLS_CERT=./certs/your-host.crt \
KONNECTD_TLS=0 \
./bin/ocis server
```

For more configuration options check the configuration secion in [ocis](https://owncloud.github.io/ocis/configuration/) and every ocis extension.

{{< hint info >}}
**TlS Certificate**\
In this example, we are replacing the default self signed cert with a CA signed one to avoid the certificate warning when accessing the login page.
{{< /hint >}}

## Use Docker Compose

We are using our [docker compose playground](https://github.com/owncloud-docker/compose-playground) as a repository to share snippets that make our test setups easier and more aligned.

You can start oCIS with docker very easily on a different host using this snippet.

Let us assume your local IP is `192.168.103.195`

```bash
git clone https://github.com/owncloud-docker/compose-playground.git
cd compose-playground/compose/ocis

sed -i -e 's/your-url/192.168.103.195/g' config/identifier-registration.yml

cat << EOF > .env
OCIS_BASE_URL=192.168.103.195
OCIS_HTTP_PORT=9200
OCIS_DOCKER_TAG=latest
EOF

docker-compose -f ocis.yml -f ../cache/redis-ocis.yml up -d

curl -k https://192.168.103.195:9200/status.php
```
