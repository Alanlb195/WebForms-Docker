# ASP.NET WebForms Dockerized Project

This repository provides a complete Docker-based environment to run an **ASP.NET
WebForms** application on **Windows Server**. It also includes automated
installation of **Crystal Reports** using **PowerShell scripts**, since the
application requires it to function properly.

## Requirements

- Docker Desktop (with support for Windows containers)

## Deployment Instructions

1. **Publish your ASP.NET WebForms application** using Visual Studio:

- Use the `Publish > Folder` option to generate the deployable files.

2. **Copy the published files** into the `/app` directory:

- **Important**: Do **not** place the entire published folder inside `/app`.
  Only copy the **files themselves**, exactly as output by the publish process.

3. **Build the Docker image**:

```bash
docker build -t webforms-app .
```

4. Run the container:

```bash
docker run -d -p 8080:80 --name webforms_app webforms-app .
```
