# Getting Started

This guide will help you set up the development environment for the 4-bit counter project.

## Prerequisites

- Linux-based operating system or WSL (Ubuntu 20.04+ recommended)
    - In case you're on Windows, running `wsl --install` on PowerShell will install WSL (Windows Subsystem for Linux), which is enough to run the tools.
- podman installed
   -  Docker is much more erratic with this container and requires adding your user to the docker group, which equals giving it root permissions.
- distrobox installed (for easier container integration)

## Environment Setup

### 1. Install Required Software

```bash
# Install podman (if not already installed)
sudo apt update
sudo apt install podman

# Install distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
```

### 2. Set Up the IIC-OSIC-Tools Container

```bash

# Create a distrobox with the container
distrobox create --image hpretl/iic-osic-tools:latest --name iic-osic-tools

# Enter the distrobox
distrobox enter iic-osic-tools
```

### 3. Clone the Repository

```bash
# Inside the container or on your host system
git clone https://github.com/matebuteler/EAMTA2026-VLSI.git
cd EAMTA2026-VLSI
```

## Working with the PDK

The IHP SG13G2 PDK should be available in the container. Verify by checking:

```bash
echo $PDK_ROOT
ls $PDK_ROOT
```

If the PDK is not available, try running `sak-pdk ihp-sh13g2` to set the correct environment variables.

## Directory Structure

After cloning, your workspace should look like:

```
EAMTA2026-VLSI/
├── design/
│   ├── blocks/         # Your block designs go here
│   └── top/
├── verification/
├── scripts/
├── tools-config/
├── examples/
└── docs/
```

## Next Steps

1. Read [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md) to understand the project requirements
2. Check [GROUP_ASSIGNMENTS.md](GROUP_ASSIGNMENTS.md) for your group's assigned block
3. Follow [STUDENT_WORKFLOW.md](STUDENT_WORKFLOW.md) for the development process
4. Review [examples/](../examples/) for reference implementations

## Troubleshooting

### Container Issues

If you have issues with the container:
- Check that podman is running: `podman ps`
- Restart the distrobox: `distrobox stop iic-osic-tools && distrobox enter iic-osic-tools`
- Check container logs: `podman logs <container-id>`

### PDK Issues

If the PDK is not found:
- Ensure you're inside the container
- Check environment variables: `env | grep PDK`
- Consult the IHP SG13G2 PDK documentation

### Tool Issues

If tools are not working:
- Verify you're in the correct container: `distrobox list`
- Check tool availability: `which xschem ngspice klayout`
- Update the container if needed: `podman pull hpretl/iic-osic-tools:latest`

## Additional Resources

- [IIC-OSIC-Tools Repository](https://github.com/hpretl/iic-osic-tools)
- [Distrobox Documentation](https://github.com/89luca89/distrobox)
- [IHP SG13G2 PDK](https://github.com/IHP-GmbH/IHP-Open-PDK)
