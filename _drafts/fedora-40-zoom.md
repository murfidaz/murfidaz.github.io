fedora 40 nggk bisa zoom, alhasil pake virtual cameranya si obs

- install dulu si v4l2loopback

  ```
  sudo dnf copr enable sentry/v4l2loopback
  sudo dnf install v4l2loopback
  modprobe v4l2loopback
  ```

- buka obs, maka aka muncul

  ![alt text](../images/obs-virtual-camera.png)

- jalankan Start Virtual Camera
- buka zoom, ketika sharescreen

  ![alt text](../images/zoom-share-screen-2nd-camera.png)
