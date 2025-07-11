# RPM Lock Generator
A tool for quickly generating RPM lockfiles &amp; .repo files

<strong> Note: </strong> <i>This tool is designed for Konflux RPM Prefetching</i>

### Requirements:
- Docker/Podman
- Skopeo credentials
- `rpms.in.yaml` file

Configure your variables in `start.sh`:

```bash
BASE_IMAGE="<your_base_image>"
ACTIVATION_KEY="<your_activation_key>"
ORG_ID="<org_id>"
SKOPEO_USERNAME="<your_username>"
SKOPEO_PASSWORD="<your_password>"
```

Start script

```bash
chmod +x start.sh
```

This will bring you into a temporary container. 
Now run the following commands in order. These will generate the necessary lockfile & copy over the `.repo` files to your mounted directory for use

```
cp redhat.repo ../source/ && \
cp ubi.repo ../source/ && \
cd ../source && \
rpm-lockfile-prototype rpms.in.yaml
```

Replace all instances of the `sslclientkey` & `sslclientcert` variables located in `redhat.repo` with the following:

```yaml
sslclientkey = $SSL_CLIENT_KEY
sslclientcert = $SSL_CLIENT_CERT
```
