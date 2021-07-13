# culturestake-provisioning

Infrastructure provisioning for [CultureStake](https://github.com/bitspossessed/culturestake) development and production environments.

## Setup

* Make a copy of `.env.example` and rename it to `.env`, edit the file according to your needs.

* Edit your `/etc/hosts` file and add the following hostnames (or similar, depending on your `.env` configuration):

    ```
    127.0.1.1 graph.culturestake.local
    ```

## Usage

**Note:** Depending on how docker was installed, some of these commands may require `sudo`, but `make contracts` and `make subgraph` do not use docker and should not require root. Running them as root will make the contracts and subgraph files owned by root, which can cause unexpected behaviour.

```
# Build all docker containers
make build

# .. use production environment
ENV=production make build

# Start containers
make up

# Show container logs
make logs

# Download and migrate contracts
make contracts

# Create and deploy subgraph
make subgraph

# Stop all containers
make down

# Stop all containers and delete all volumes
make delete

# Remove temporary files
make clean
```

## Credits

CultureStake is a [Furtherfield](https://www.furtherfield.org/) / [DECAL](http://www.decal.is/) initiative.

## License

GNU Affero General Public License v3.0 `AGPL-3.0`
