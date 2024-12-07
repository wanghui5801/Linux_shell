# General Linux shell

## SSH public key

Before start this shell, you can create the public key by following code.

```shell
ssh-keygen -t ed25519 -C "Your comment"
```

`cat` the content of the file `id_ed25519.pub`.

This command can be used both on Linux and Windows.

Then use it.

```shell
bash <(curl -s https://raw.githubusercontent.com/wanghui5801/Linux_shell/refs/heads/main/ssh.sh)
```

## Usage Guide

### Adding SSH Public Key

1. **Generate SSH Key**: Use the following command to generate an SSH key:
    ```shell
    ssh-keygen -t ed25519 -C "Your comment"
    ```

2. **Display Public Key**: Display the content of the generated public key file:
    ```shell
    cat ~/.ssh/id_ed25519.pub
    ```

3. **Run the Script**: Execute the provided script to add your SSH public key to the server:
    ```shell
    bash <(curl -s https://raw.githubusercontent.com/wanghui5801/Linux_shell/refs/heads/main/ssh.sh)
    ```

4. **Enter Public Key**: When prompted, paste the content of your public key and press Enter.

5. **Completion**: The script will add your key to the server and configure SSH settings. You will see a "Done" message upon successful completion.

### Setting Up Swap Space

1. **Run the Script**: Execute the provided script to set up swap space:
    ```shell
    bash <(curl -s https://raw.githubusercontent.com/wanghui5801/Linux_shell/refs/heads/main/swapspace.sh)
    ```

2. **Enter Swap Size**: When prompted, enter the desired swap file size in gigabytes (e.g., 2).

3. **Completion**: The script will:
   - Create a swap file with your specified size
   - Set the appropriate permissions
   - Enable the swap file
   - Add it to `/etc/fstab` for persistence
   You will see a "Swap setup complete" message upon successful completion.

4. **Verify Swap**: After running the script, you can verify that the swap file is enabled by running:
    ```shell
    swapon --show
    ```

5. **Check Memory Usage**: The script will also display the current memory usage:
    ```shell
    free -h
    ```

This guide will help you set up SSH access to your server securely and manage swap space efficiently.
