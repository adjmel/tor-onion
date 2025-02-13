
### **Installation and Usage of Tor, HTML, and SSH**

#### **1. Download and Install Tor Browser**

To use Tor, you need to install the **Tor Browser**. Here's how:

- **Download Tor Browser**:
  - Go to the official [Tor Project website](https://www.torproject.org/download/) and download the appropriate version for your operating system.

- **Install Tor Browser**:
  - Follow the installation instructions specific to your platform.

- **Start Tor Browser**:
  - Once installed, you can start Tor by navigating to its folder and running:
    ```bash
    ./start-tor-browser.desktop
    ```

---

#### **3. Docker Setup and Usage**

Now that Docker and Tor are installed, you can work with Docker containers and your website. Here’s what to do next:

- **Clean Docker System (optional)**:
  - Run this command to prune unused Docker data:
    ```bash
    docker system prune -a --volumes
    ```

- **Check Running Containers**:
  - To list all running Docker containers:
    ```bash
    docker ps
    ```

- **Stop a Running Container**:
  - To stop a specific container:
    ```bash
    docker stop <container_name_or_id>
    ```

- **Remove a Container**:
  - To remove a specific container:
    ```bash
    docker rm <container_name_or_id>
    ```

- **Build Docker Image**:
  - To build your Docker image, navigate to the folder where your `Dockerfile` is located, and run:
    ```bash
    docker build -t onion .
    ```

- **Run Docker Container**:
  - To run your Docker container and expose it to certain ports:
    ```bash
    docker run -p 8080:80 -p 4000:4242 onion
    ```

  **Note**: Port 80 is a privileged port under Linux, so it requires root privileges. You can either run Docker with root permissions, use a VM, or map ports as shown in the above command.

---

#### **4. Accessing the Website (Index.html)**

- After running the Docker container, you can access your website:
  - Open your browser in the VM or host machine and enter:
    ```
    http://localhost:8080
    ```

  - The website should load, and you should see the index.html page displayed.

---

#### **5. SSH Access to Docker Container**

To access the Docker container via SSH, you need to map a different port (since port 22 might not be exposed directly).

- **Run Docker with SSH port exposed**:
  ```bash
  docker run -p 8080:80 -p 4000:4242 onion
  ```

  Here, port 4000 on your host machine is mapped to port 4242 of the container.

- **SSH into the Docker container**:
  - To SSH into the running Docker container, use the following command:
    ```bash
    ssh -p 4000 user@localhost
    ```

  This will allow you to access the container's shell through SSH.

---

### **Summary of Commands**

- **Docker Commands**:
  ```bash
  docker system prune -a --volumes   # Clean Docker system
  docker ps                         # List running containers
  docker stop <container_id>         # Stop a container
  docker rm <container_id>           # Remove a container
  docker build -t onion .            # Build Docker image
  docker run -p 8080:80 -p 4000:4242 onion  # Run Docker container with port mapping
  ```

- **SSH Command**:
  ```bash
  ssh -p 4000 user@localhost         # SSH into the container
  ```

- **Tor Browser Command**:
  ```bash
  ./start-tor-browser.desktop       # Start the Tor Browser
  ```

---

### **Conclusion**

Ensure you have both **Docker** and **Tor** installed before proceeding with the above steps. These tools will enable you to manage containers, access your website, and work with SSH securely.

