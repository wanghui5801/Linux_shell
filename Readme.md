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
