- bikin vm sesuai scope network digoogle
- kemudian konek via ssh tunnel untuk akes, contoh konek ke memory store

    `gcloud compute ssh tester-vm  --zone=asia-southeast2-a  -- -N -L 6379:10.184.0.47:6379`